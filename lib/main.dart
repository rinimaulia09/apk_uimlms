import 'package:flutter/material.dart';
import 'package:apk_uimlms/screens/main_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIM LMS',
      theme: ThemeData(
        // Using UIM color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006D34), // UIM Green
          primary: const Color(0xFF006D34), // UIM Green
          secondary: const Color(0xFFFFD700), // Gold/Yellow
        ),
        useMaterial3: true,
        // Using clean, modern font
        fontFamily: 'Roboto',
      ),
      home: const MainApp(),
    );
  }
}
