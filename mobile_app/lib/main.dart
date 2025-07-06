import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/create_event_screen.dart';
import 'screens/event_detail_screen.dart';

void main() {
  runApp(const ENRSVPManagerApp());
}

class ENRSVPManagerApp extends StatelessWidget {
  const ENRSVPManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ENRSVP Manager',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF1B1B2F),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
        ),
      ),
      ),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page non trouvée')),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/create': (context) => const CreateEventScreen(),
        '/event': (context) => const EventDetailScreen(),
      },
    );
  }
}