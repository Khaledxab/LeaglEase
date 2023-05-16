import 'package:flutter/material.dart';
import 'package:legalease/screens/client/lawyer_list.dart';
import 'package:legalease/screens/client/first.dart';
import 'package:legalease/screens/welcome.dart';

import 'screens/Lawyer/profile_LW.dart';

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
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
