import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiData extends StatefulWidget {
  const ApiData({super.key});

  @override
  State<ApiData> createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  final _searchController = TextEditingController();
  bool _isLoading = false;
  List<dynamic> _users = [];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Dio().get('https://randomuser.me/api/?results=50');

      if (response.statusCode == 200) {
        setState(() {
          _users = response.data['results'];
          _isLoading = false;
        });
      } else {
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<dynamic> _searchUsers(String query) {
    return _users
        .where((user) => '${user['name']['first']} ${user['name']['last']}'
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      final results = _searchUsers(query);
      setState(() {
        _users = results;
      });
    } else {
      _fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User API Demo'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _handleSearch,
                    decoration: const InputDecoration(
                      hintText: 'Search by name',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = _users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(user['picture']['thumbnail']),
                        ),
                        title: Text(
                            '${user['name']['first']} ${user['name']['last']}'),
                        subtitle: Text(user['email']),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
