import 'package:flutter/material.dart';
import '../models/event.dart';
import '../sevices/api_services.dart';

class EventDetailScreen extends StatefulWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late int accepted;
  late int declined;
  late int maybe;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    accepted = widget.event.acceptedCount;
    declined = widget.event.declinedCount;
    maybe = widget.event.maybeCount;
  }

  Future<void> _respondRSVP(String response) async {
    setState(() { isLoading = true; });
    final success = await ApiService.respondRSVP(widget.event.id, response);
    setState(() { isLoading = false; });
    if (success) {
      setState(() {
        if (response == 'accepted') accepted++;
        if (response == 'declined') declined++;
        if (response == 'maybe') maybe++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('RSVP enregistré : $response')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erreur lors de l\'enregistrement du RSVP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Scaffold(
      appBar: AppBar(title: const Text("Event Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text("Location: ${event.location}"),
            Text("Date: ${event.date.toLocal()}"),
            const SizedBox(height: 24),
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(event is Event ? event.toString() : ''),
            const SizedBox(height: 24),
            const Text("RSVP Status:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Accepted", style: TextStyle(color: Colors.green)),
                    Text("$accepted"),
                  ],
                ),
                Column(
                  children: [
                    const Text("Declined", style: TextStyle(color: Colors.red)),
                    Text("$declined"),
                  ],
                ),
                Column(
                  children: [
                    const Text("Maybe", style: TextStyle(color: Colors.orange)),
                    Text("$maybe"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : () {
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
                              _respondRSVP('accepted');
                            },
                          ),
                          ListTile(
                            title: const Text("Decline"),
                            leading: const Icon(Icons.close, color: Colors.red),
                            onTap: () {
                              Navigator.pop(context);
                              _respondRSVP('declined');
                            },
                          ),
                          ListTile(
                            title: const Text("Maybe"),
                            leading: const Icon(Icons.question_mark, color: Colors.orange),
                            onTap: () {
                              Navigator.pop(context);
                              _respondRSVP('maybe');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text("Respond to Invitation"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}