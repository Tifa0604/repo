class User {
  final String email;
  final String password;
  final String? status;
  final String? role;

  User({
    required this.email,
    required this.password,
    this.status,
    this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': email,
      'password': password,
      'status': status ?? 'Active',
      'role': role ?? 'user',
    };
  }
}

class LoginRequest {
  final String api_user;
  final String api_password;

  LoginRequest({
    required this.api_user,
    required this.api_password,
  });

  Map<String, dynamic> toJson() {
    return {
      'api_user': api_user,
      'api_password': api_password,
    };
  }
}