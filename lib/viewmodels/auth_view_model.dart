import 'package:find_space_station/core/services/log_service.dart';
import 'package:find_space_station/data/dto/auth_dto.dart';
import 'package:find_space_station/data/repositories/remote/auth_repository.dart';
import 'package:find_space_station/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthViewModel extends ChangeNotifier {
  var isLoading = true;
  var anonymousLoginSuccess = false;

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      var userCredential = await FirebaseAuth.instance.signInAnonymously();
      Log.create(Level.info, "Anonymous Login Successful for ${userCredential.user?.uid ?? "N/A"}");
      anonymousLoginSuccess = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 700), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      });

      notifyListeners();
    } catch (error) {
      anonymousLoginSuccess = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to sign in anonymously")),
      );
      throw Exception(error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
