import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eventmate/main.dart';
import 'package:eventmate/screens/login_screen.dart';
import 'package:eventmate/screens/home_screen.dart';

void main() {
  group('ENRSVP Manager Widget Tests', () {
    testWidgets('App loads and shows login screen by default', 
    (WidgetTester tester) async {
      // Build our app
      await tester.pumpWidget(const ENRSVPManagerApp());

      // Verify the login screen is shown
      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('Welcome to ENRSVP Manager'), findsOneWidget);
    });

    testWidgets('Login screen has email and password fields', 
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Verify the presence of input fields
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Can navigate from login to home screen', 
    (WidgetTester tester) async {
      await tester.pumpWidget(const ENRSVPManagerApp());

      // Tap the login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify we're on the home screen
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('Public Events'), findsOneWidget);
    });

    testWidgets('Home screen shows event list and FAB', 
    (WidgetTester tester) async {
      await tester.pumpWidget( const MaterialApp(home: HomeScreen()));

      // Verify the presence of key elements
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Create event button navigates to create event screen', 
    (WidgetTester tester) async {
      await tester.pumpWidget(const ENRSVPManagerApp());

      // Navigate to home screen first
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Tap the FAB
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Verify we're on the create event screen
      expect(find.text("Event's title"), findsOneWidget);
      expect(find.text("Event's Location"), findsOneWidget);
    });

    testWidgets('Sign up link navigates to sign up screen', 
    (WidgetTester tester) async {
      await tester.pumpWidget(const ENRSVPManagerApp());

      // Tap the sign up link
      await tester.tap(find.text("Don't have an account? Create one"));
      await tester.pumpAndSettle();

      // Verify we're on the sign up screen
      expect(find.text('Create your ENRSVP Account'), findsOneWidget);
      expect(find.byKey(const Key('nameField')), findsOneWidget);
    });
  });
}