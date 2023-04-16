import 'package:flutter/material.dart';
import 'package:legalease/screens/client/client_home.dart';
import 'package:legalease/screens/client/first.dart';
import 'package:legalease/screens/welcome.dart';

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
      home: clHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
