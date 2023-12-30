import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications_sharp),
            title: Text('Notification 3'),
            subtitle: Text('This is a notification'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications_sharp),
            title: Text('Notification 4'),
            subtitle: Text('This is a notification'),
          ),
        ),
      ],
    );
  }
}
