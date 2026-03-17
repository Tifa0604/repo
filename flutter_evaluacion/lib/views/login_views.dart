import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import 'home_views.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final email = TextEditingController();
  final password = TextEditingController();

  void login() async {
    print('boton login presionado');

    final data = await AuthService().login(
      email.text,
      password.text,
    );

    print('respuesta del login: $data');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(
            email: data?['email'],
            role: data?['role'] ??"Admin",
          ),
        ),
      );
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Icon(
                Icons.person,
                size: 60,
                color: Colors.purple,
              ),

              const SizedBox(height: 20),

             
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),

              const SizedBox(height: 10),

              
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),

              const SizedBox(height: 20),

              
              ElevatedButton(
                onPressed: login,
                child: const Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }

