import 'dart:convert';
import 'package:http/http.dart' as http;

import '../MVVM/Model/user_model.dart';



class AuthRepository {
  Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        print('Error: ${response.statusCode}, Body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e');
      return null;
    }
  }
}

