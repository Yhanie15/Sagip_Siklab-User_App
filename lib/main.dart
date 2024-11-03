import 'package:flutter/material.dart';
import 'loading_screen.dart'; // Import the loading screen file
import 'login_screen.dart';   // Import the login screen file

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sagip Siklab',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
