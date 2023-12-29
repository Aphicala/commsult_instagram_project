import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: topBar(context), body: Column());
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Instagram',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is notifications')));
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is direct messages')));
            },
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.black,
            ))
      ],
    );
  }
}
