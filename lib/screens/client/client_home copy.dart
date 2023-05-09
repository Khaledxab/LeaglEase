import 'package:flutter/material.dart';

class createCase extends StatefulWidget {
  @override
  _createCaseState createState() => _createCaseState();
}

class _createCaseState extends State<createCase> {
  // Define variables to store case details
  String _caseTitle = '';
  String _caseDescription = '';
  String _caseType = 'Civil';

  // Define a list of case type options
  final List<String> _caseTypeOptions = [    'Civil',    'Criminal',    'Family',    'Corporate',    'Other'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Case'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Case Title',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _caseTitle = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Case Description',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _caseDescription = value;
                });
              },
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Case Type',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            DropdownButton(
              value: _caseType,
              onChanged: (value) {
                setState(() {
                  _caseType = value.toString();
                });
              },
              items: _caseTypeOptions.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              underline: SizedBox(),
              elevation: 8,
              focusColor: Colors.blue,
              focusNode: FocusNode(),
              dropdownColor: Colors.grey[200],
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement case creation logic
                },
                child: Text('Create Case'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
