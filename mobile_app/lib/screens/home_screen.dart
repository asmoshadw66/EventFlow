import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Events")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text("Board Game Night"),
            subtitle: Text("Jun 5, 2024 - Private"),
            onTap: () {
              Navigator.pushNamed(context, '/event');
            },
          ),
          ListTile(
            title: Text("Business Strategy Meeting"),
            subtitle: Text("May 20, 2024 - Public"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}