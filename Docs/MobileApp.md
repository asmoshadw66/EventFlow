# 📱 Documentation Frontend Flutter - EventFlow

## 📂 Structure des Fichiers

## 🔌 Configuration API
```dart
// config.dart
class ApiConfig {
  static const String baseUrl = kDebugMode
      ? 'http://10.0.2.2:5000/api'  // Développement
      : 'https://api.eventflow.com'; // Production

  static Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}

// routes.dart
class Routes {
  static const String home = '/';
  static const String eventDetails = '/event-details';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case eventDetails:
        final event = settings.arguments as Event;
        return MaterialPageRoute(builder: (_) => EventDetailScreen(event: event));
      default:
        return _errorRoute();
    }
  }
}// routes.dart
class Routes {
  static const String home = '/';
  static const String eventDetails = '/event-details';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case eventDetails:
        final event = settings.arguments as Event;
        return MaterialPageRoute(builder: (_) => EventDetailScreen(event: event));
      default:
        return _errorRoute();
    }
  }
}// routes.dart
class Routes {
  static const String home = '/';
  static const String eventDetails = '/event-details';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case eventDetails:
        final event = settings.arguments as Event;
        return MaterialPageRoute(builder: (_) => EventDetailScreen(event: event));
      default:
        return _errorRoute();
    }
  }
}
