import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_starter/core/services/log_service.dart';
import 'package:flutter_mvvm_starter/data/dto/auth_dto.dart';
import 'package:flutter_mvvm_starter/data/models/data_model/data.dart';
import 'package:flutter_mvvm_starter/data/repositories/remote/auth_repository.dart';
import 'package:logger/logger.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  var isLoading = false;
  var _isObscure = true;

  bool get isObscure => _isObscure;

  AuthViewModel({required this.authRepository});

  void toggleObscureness() {
    _isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> login(BuildContext context, AuthDto authDto) async {
    isLoading = true;
    notifyListeners();
    try {
      Data? authResponse =
          await authRepository.login({'username': authDto.username, 'password': authDto.password});

      Log.create(Level.info, "Successfully Logged In: ${jsonEncode(authResponse)}");
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
