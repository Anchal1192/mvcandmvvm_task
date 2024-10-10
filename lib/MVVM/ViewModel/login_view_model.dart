import 'package:flutter/material.dart';
import '../../repository/login_repo.dart';
import '../Model/user_model.dart';


class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  String _errorMessage = '';
  bool _isLoading = false;
  User? _user;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  User? get user => _user;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    if (username.isEmpty) {
      _errorMessage = 'Please enter your email.';
      _isLoading = false;
      notifyListeners();
      return false;
    }

    if (password.isEmpty) {
      _errorMessage = 'Please enter your password.';
      _isLoading = false;
      notifyListeners();
      return false;
    }

    User? user = await _authRepository.login(username, password); 

    if (user != null) {
      _user = user;
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Invalid username or password';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
