import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Board Game Night", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Location: New York"),
            Text("Date: Jun 5, 2024"),
            Text("Visibility: Private"),
            SizedBox(height: 20),
            Text("Responses:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(title: Text("Alice"), trailing: Text("✅ Accepted")),
            ListTile(title: Text("Bob"), trailing: Text("❌ Declined")),
            ListTile(title: Text("Eve"), trailing: Text("❓ Maybe")),
            ListTile(title: Text("You"), trailing: Text("✅ Accepted")),
          ],
        ),
      ),
    );
  }
}