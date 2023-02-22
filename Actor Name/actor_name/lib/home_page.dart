import 'package:actor_name/actor_page.dart';
import 'package:flutter/material.dart';

class Actor {
  final String name;
  final String imageUrl;

  Actor(this.name, this.imageUrl);
}

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();

  HomePage({super.key});

  void _saveActor(BuildContext context) {
    final name = _nameController.text.trim();
    final imageUrl = _imageUrlController.text.trim();
    if (name.isNotEmpty && imageUrl.isNotEmpty) {
      final actor = Actor(name, imageUrl);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActorPage(actor)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Actor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Actor Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter actor name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Actor Image URL',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveActor(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
