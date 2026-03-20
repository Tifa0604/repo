import 'package:flutter/material.dart';
import '../../Services/auth_service.dart';
import '../../models/api_response.dart';

class RegisterView extends StatefulWidget {

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  
  bool cargando = false;
  String mensajeError = '';
  void crearRol() async {
    // Valida que el campo nombre del rol no esté vacío.
    if (nombreController.text.isEmpty) {
      setState(() {
        mensajeError = 'El nombre del rol es obligatorio';
      });
      return;
    }

    // Valida que el campo de descripción no esté vacío.
    if (descripcionController.text.trim().isEmpty) {
      setState(() {
        mensajeError = 'La descripción del rol es obligatoria';
      });
      return;
    }

    setState(() {
      mensajeError = '';
      cargando = true;
    });

    ApiResponse respuesta = await AuthService.createRole(
      nombreController.text.trim(),
      descripcionController.text.trim(),
    );

    setState(() {
      cargando = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(respuesta.message),
        backgroundColor: respuesta.success ? Colors.green : Colors.red,
      ),
    );

    if (respuesta.success) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Crear Rol',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText:'Rol' ,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
      
            TextField(
              controller: descripcionController,
            minLines: 3,
            maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Descripcion',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

          
            if (mensajeError.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: Colors.red[100],
                child: Text(
                  mensajeError,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            if (mensajeError.isNotEmpty) SizedBox(height: 20),

               
                ElevatedButton(
                    onPressed: crearRol,
                    child: Text(
                      'Crear',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                     
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}