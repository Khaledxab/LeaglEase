import 'package:flutter/material.dart';
import 'package:legalease/screens/login_screen.dart';
import 'package:legalease/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}

