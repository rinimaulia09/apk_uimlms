import 'package:flutter/material.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Kelas Saya', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
