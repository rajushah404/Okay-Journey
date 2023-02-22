import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Design"),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black54,
                  maxRadius: 50,
                  minRadius: 50,
                  backgroundImage: AssetImage('assets/image/images.png'),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 50),
                      child: Column(
                        children: const [
                          SizedBox(child: Text("Intern")),
                          Text(
                            "Raju Shah",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Icon(Icons.notification_add),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            height: 150,
            width: double.infinity,
            child: const Text(
              'S.N',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            height: 150,
            width: double.infinity,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            height: 150,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
