// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_final_project/models/user/user_model.dart';
import 'package:flutter_final_project/utils/login_validator.dart';

class LoginController extends ChangeNotifier {
  UserModel? _loggedInUser;
  String _email = '';
  String _password = '';
  String? _errorEmailMessage;
  String? _errorPasswordMessage;
  bool _isLoading = false;
  
  UserModel? get loggedInUser => _loggedInUser;
  String? get errorEmailMessage => _errorEmailMessage;
  String? get errorPasswordMessage => _errorPasswordMessage;
  bool get isEmailValid => LoginValidator.isEmailValid(_email);
  bool get isPasswordValid => LoginValidator.isPasswordValid(_password);
  bool get isLoading => _isLoading;
  
  void updateEmail(String email) {
    if (LoginValidator.isEmailValid(email)) {
      _email = email;
      _errorEmailMessage = null;
      notifyListeners();
      return;
    }
    _email = email;
    _errorEmailMessage = 'El Email debe contener @ y una extension. Ejemplo: (.co , .com , .es)';
    notifyListeners();
    return;
  }

  void updatePassword(String password) {
    
    if (LoginValidator.isPasswordValid(password)) {
      _password = password;
      _errorPasswordMessage = null;
      notifyListeners();
      return;
    }
    _password = password;
    _errorPasswordMessage = 'Password must have at least 7 characters';
    notifyListeners();
    return;
  }

  Future<void> login(String email, String password, BuildContext context) async {

    // Simulate an async login process (replace with actual authentication)
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
    // Check the login credentials and set the loggedInUser
    if (email == 'test@gmail.com' && password == 'password') {
      _loggedInUser = UserModel(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('/menu');
      
    } else {
      _loggedInUser = null;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid user!')),
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });

    _loggedInUser = null;
    notifyListeners();
  }
}
