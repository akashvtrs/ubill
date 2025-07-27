import 'package:flutter/material.dart';
import 'package:ubill/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ubill',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFD8D9EA)),
      home: const SplashScreen(),
    );
  }
}
