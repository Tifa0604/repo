import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio(
    BaseOptions(baseUrl:
    "http://10.0.2.2:3000"),
);
 Future<Map<String, dynamic>?>
login(String email, String password) async {
    try {
      final response = await dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } catch (e) {
      print('Error conexion: $e');
      return null;
    }
  }
}