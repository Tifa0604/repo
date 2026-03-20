import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';



class AuthService {
  
  static const String baseUrl = 'http://localhost:3000/api_v1';
  
  
  static Future<ApiResponse> login(String email, String password) async {
   
    try {
      print(' Login: $email');
      
      final response = await http.post(
        Uri.parse('$baseUrl/apiUserLogin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'api_user': email,
          'api_password': password,
        }),
      );

      print(' Código: ${response.statusCode}');

      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          message: 'Login exitoso',
        );
      } else {
        return ApiResponse(
          success: false,
          message: ' Usuario o contraseña incorrectos',
        );
      }
    } catch (e) {
      print(' Error: $e');
      return ApiResponse(
        success: false,
        message: ' Error de conexión',
      );
    }
  }


  static Future<ApiResponse> createRole(String name, [String description = '']) async {
    try {
      print(' Creando rol: $name');
      print('URL: $baseUrl/role');
      
      Map<String, dynamic> body = {
        'name': name,
        'description': description,
      };
      
      print(' Body: $body');

      final response = await http.post(
        Uri.parse('$baseUrl/role'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      print(' Código: ${response.statusCode}');
      print(' Respuesta: ${response.body}');

      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          success: true,
          message: ' Rol: $name creado',
        );
      } else {
        return ApiResponse(
          success: false,
          message: ' Error al crear rol',
        );
      }
    } catch (e) {
      print(' Error: $e');
      return ApiResponse(
        success: false,
        message: ' Error de conexión',
      );
    }
  }

  
  static Future<bool> probarConexion() async {
    try {
      await http.get(
        Uri.parse('$baseUrl/role'),
      ).timeout(Duration(seconds: 3));
      
      return true;
    } catch (e) {
      return false;
    }
  }
}