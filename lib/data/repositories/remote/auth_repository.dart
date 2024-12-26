import 'package:flutter_mvvm_starter/core/services/api_service.dart';
import 'package:flutter_mvvm_starter/data/models/data_model/data.dart';
import 'package:flutter_mvvm_starter/utils/config/env.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<Data>? login(Map<String, dynamic> body) async {
    dynamic json;
    try {
      json = await apiService.callApi("POST", Uri.parse('${Env().apiBaseUrl}/auth/login'),
          {'Content-Type': 'application/json'}, body);
      if (json == null) throw Exception('Bad Response');
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      return Data.fromJson(json);
    }
  }
}
