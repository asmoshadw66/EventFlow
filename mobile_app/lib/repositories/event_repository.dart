// ignore: unused_import
import '../config/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventRepository {
  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse('${AppConfig.apiUrl}/api/events'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement');
    }
  }
}
