import 'package:flutter/material.dart';
class HomeView extends StatelessWidget {
  final String email;
  final String role;

  const HomeView({
   super.key,
   required this.email, 
   required this.role,
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (title: const Text('Home')
      ),
      body: Center(
        child: Text(
          'Bienvenido $email\nRol: $role',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}