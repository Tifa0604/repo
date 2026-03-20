import 'package:flutter/material.dart';
import '../register/register_view.dart';
import '../../Services/auth_service.dart';
import '../../models/api_response.dart';
import '../home/home_view.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  void iniciarSesion() async {
    
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    ApiResponse respuesta = await AuthService.login(
      emailController.text,
      passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(respuesta.message)),
    );

    if (respuesta.success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
    
      body: Padding(
        padding: EdgeInsets.all(100),
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Iniciar sesion',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),

            
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(height: 20),

            
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(height: 20),

                 ElevatedButton(
                    onPressed: iniciarSesion,
                    child: Text('INGRESAR'),
                    style: ElevatedButton.styleFrom(
                     
                    ),
                  ),
            SizedBox(height: 25),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: Text('Registrar nuevo usuario'),
            ),
          ],
        ),
      ),
    );
  }
}