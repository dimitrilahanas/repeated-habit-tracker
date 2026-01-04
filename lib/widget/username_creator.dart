import 'package:flutter/material.dart';

class UsernameCreator extends StatelessWidget {
  final VoidCallback saveTap;
  final controller;
  const UsernameCreator({
    super.key,
    required this.saveTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Name'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter your name',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: saveTap,
          child: const Text('Save'),
        ),
      ],
    );
  }
}