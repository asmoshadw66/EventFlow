import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../config/config.dart';

class ApiService {


  static void setToken(String token) {
  }

  static Future<bool> registerUser(User user) async {
    final url = Uri.parse('${AppConfig.apiUrl}/api/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      // On peut aussi retourner le message d'erreur si besoin
      return false;
    }
  }

  static Future<String?> loginUser(String email, String password) async {
    final url = Uri.parse('${AppConfig.apiUrl}/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'mail': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }

  static Future<bool> createEvent(String title, String location, String description, DateTime date) async {
    final url = Uri.parse('${AppConfig.apiUrl}/api/events');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'location': location,
        'description': description,
        'date': date.toIso8601String(),
      }),
    );
    return response.statusCode == 201;
  }

  static Future<bool> respondRSVP(String eventId, String response) async {
    final url = Uri.parse('${AppConfig.apiUrl}/api/events/$eventId/rsvp');
    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'response': response}),
    );
    return res.statusCode == 200 || res.statusCode == 201;
  }
}