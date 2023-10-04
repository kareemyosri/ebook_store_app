import 'package:flutter/material.dart';

class EmptyResultsScreen extends StatelessWidget {
  const EmptyResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/Empty_screen.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
