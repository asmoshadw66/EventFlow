import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/create_event_screen.dart';
import 'screens/event_detail_screen.dart';

void main() {
  runApp(const EventMateApp());
}

class EventMateApp extends StatelessWidget {
  const EventMateApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EventMate',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF1B1B2F),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/create': (context) => CreateEventScreen(),
        '/event': (context) => EventDetailScreen(),
      },
    );
  }
}