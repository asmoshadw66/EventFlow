import 'package:flutter/material.dart';
import '../repositories/event_repository.dart';
import '../models/event.dart';

// Widget public
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState(); // Utilise une classe publique
}

// Classe State rendue publique (suppression du _)
class HomeScreenState extends State<HomeScreen> {
  final EventRepository _repository = EventRepository();
  late Future<List<Event>> _futureEvents;

  @override
  void initState() {
    super.initState();
    _futureEvents = _repository.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Événements')),
      body: FutureBuilder<List<Event>>(
        future: _futureEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final event = snapshot.data![index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.location),
                      const SizedBox(height: 4),
                      Text('Accepted: ${event.acceptedCount}   Declined: ${event.declinedCount}   Maybe: ${event.maybeCount}',
                        style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}