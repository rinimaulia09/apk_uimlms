import 'package:flutter/material.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Kelas Saya', style: TextStyle(fontSize: 24))),
    );
  }
}
