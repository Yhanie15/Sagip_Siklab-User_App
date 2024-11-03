import 'package:flutter/material.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState(); // Remove the underscore to make it public
}

class LoadingScreenState extends State<LoadingScreen> { // Also remove underscore here to make it public
  @override
  void initState() {
    super.initState();
    // Navigate to Login Screen after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/logo.png', // Ensure this is in your assets folder
              height: 150,
            ),
            const SizedBox(height: 20),
            // App name
            const Text(
              'SAGIPSIKLAB',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
