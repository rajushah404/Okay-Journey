import 'package:actor_name/home_page.dart';
import 'package:flutter/material.dart';

class ActorPage extends StatelessWidget {
  final Actor actor;

  const ActorPage(this.actor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(actor.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(actor.imageUrl),
              radius: 100,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            actor.name,
            style: const TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
