import 'package:flutter/foundation.dart';

class AppConfig {
  /// Configuration des environnements
  static const String apiUrl = kDebugMode
      ? 'http://10.0.2.2:5000'    // Développement (émulateur)
      : 'https://api.prod.com';    // Production

  /// Endpoints API
  static const String eventsEndpoint = '/events';
  static const String usersEndpoint = '/users';
}

class ApiServiceConfig {
  /// Configuration commune des requêtes
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Méthode pour obtenir les headers avec auth
  static Map<String, String> headersWithAuth(String token) {
    return {
      ...defaultHeaders,
      'Authorization': 'Bearer $token',
    };
  }

  /// Timeout configuration
  static const Duration timeout = Duration(seconds: 30);
}