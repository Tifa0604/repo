import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono
              Icon(
                Icons.home,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              
              // Mensaje de bienvenida
              Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}