import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Center(
              child: Text(
        "Home",
        style: TextStyle(fontSize: 24),
      ))),
    );
  }
}
