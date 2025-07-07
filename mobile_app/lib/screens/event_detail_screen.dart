import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Tech Conference", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Location: New York Convention Center"),
            const Text("Date: August 15, 2025 at 9:00 AM"),
            const Text("Organizer: Tech Org Inc."),
            const Text("Visibility: Public"),
            const SizedBox(height: 24),
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Annual technology conference featuring the latest innovations in AI, blockchain, and cloud computing."),
            const SizedBox(height: 24),
            const Text("RSVP Status:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Accepted", style: TextStyle(color: Colors.green)),
                     Text("12"),
                  ],
                ),
                Column(
                  children: [
                    Text("Declined", style: TextStyle(color: Colors.red)),
                     Text("3"),
                  ],
                ),
                Column(
                  children: [
                    Text("Maybe", style: TextStyle(color: Colors.orange)),
                     Text("5"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Show RSVP dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Will you attend?"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text("Accept"),
                            leading: const Icon(Icons.check, color: Colors.green),
                            onTap: () {
                              Navigator.pop(context);
                              // Handle accept
                            },
                          ),
                          ListTile(
                            title: const Text("Decline"),
                            leading: const Icon(Icons.close, color: Colors.red),
                            onTap: () {
                              Navigator.pop(context);
                              // Handle decline
                            },
                          ),
                          ListTile(
                            title: const Text("Maybe"),
                            leading: const Icon(Icons.question_mark, color: Colors.orange),
                            onTap: () {
                              Navigator.pop(context);
                              // Handle maybe
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("Respond to Invitation"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}