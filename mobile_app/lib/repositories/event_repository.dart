import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventRepository {
  static const String _baseUrl = 'http://10.0.2.2:5000/api'; // Android Emulator

  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse('$_baseUrl/events'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement');
    }
  }
}