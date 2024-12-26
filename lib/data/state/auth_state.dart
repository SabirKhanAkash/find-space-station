import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  var _isObscure = true;

  bool get isObscure => _isObscure;

  void toggleObscureness() {
    _isObscure = !isObscure;
    notifyListeners();
  }
}
