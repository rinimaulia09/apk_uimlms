import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Profil', style: TextStyle(fontSize: 24))),
    );
  }
}
