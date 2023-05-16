import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';
import '../widgets/my_nav_bar.dart';

class lwListe extends StatelessWidget {
  Future<List<dynamic>> _getUsers() async {
    final response = await http.get(Uri.parse(users));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["users"];
    } else {
      throw Exception("Failed to load users");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(child: Text('Lawyers List')),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user["firstName"][0] + user["secondName"][0]),
                  ),
                  title: Text(user["firstName"] + " " + user["secondName"]),
                  subtitle: Text(user["email"]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarCurvedFb1(),
    );
  }
}
