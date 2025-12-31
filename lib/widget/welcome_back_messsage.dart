import 'package:flutter/material.dart';

class WelcomeBackMesssage extends StatelessWidget {
  final String userName;

  const WelcomeBackMesssage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Welcome back,',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            )
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            userName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
            )
          ),
        ),
      ],
    );
  }
}