import 'package:flutter/material.dart';

import '../widgets/my_nav_bar.dart';



class MyCasesHistoryPage extends StatelessWidget {
  final List<String> _cases = [
    'Case 1',
    'Case 2',
    'Case 3',
    'Case 4',
    'Case 5',
    'Case 6',
    'Case 7',
    'Case 8',
    'Case 9',
    'Case 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cases History'),
      ),
      body: ListView.builder(
        itemCount: _cases.length,
        itemBuilder: (context, index) {
          final caseName = _cases[index];
          return ListTile(
            title: Text(caseName),
            subtitle: Text('Random description of $caseName'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to the details page for the selected case
            },
          );
        },
      ),
      extendBody: true,
            bottomNavigationBar: const BottomNavBarCurvedFb1(),

    );
  }
}

