import 'package:flutter/material.dart';
import 'package:projek/screen/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Dairy',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF9CD7CC),
      ),
      home: LandingPage(),
    );
  }
}
