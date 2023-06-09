import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legalease/screens/welcome.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:legalease/screens/client/lawyer_list.dart';

class HomeScreen extends StatefulWidget {
  final token;
  const HomeScreen({@required this.token, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email;
  

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    email = jwtDecodedToken['email'];

    
    Timer timer = Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => lwListe()));
    });
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LegalEase"),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("You are logged in as",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text(email,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      extendBody: true,

    );
  }
}
