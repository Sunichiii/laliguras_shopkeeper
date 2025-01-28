import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.green, // Adjust color to your app's theme
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Use your app's primary color
          ),
          child: const Text('Go to Shopkeeper Homepage'),
        ),
      ),
    );
  }
}
