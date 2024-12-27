import 'package:find_space_station/core/services/api_service.dart';
import 'package:find_space_station/core/services/log_service.dart';
import 'package:find_space_station/data/models/data_model/data.dart';
import 'package:find_space_station/utils/config/api_endpoint.dart';
import 'package:logger/logger.dart';

class HomeRepository {
  final ApiService apiService;

  HomeRepository({required this.apiService});

  Future<Data?> getIssCurrentLocation(Map<String, dynamic>? body) async {
    dynamic json;
    try {
      json = await apiService.callApi(
          "GET", Uri.parse(ApiEndpoint().issNow), {'Content-Type': 'application/json'}, body);
      if (json == null) throw Exception('Bad Response');
    } catch (error) {
      // Log.create(Level.error, "Error: $error");
      throw Exception(error.toString());
    } finally {
      if (json != null) {
        return Data.fromJson(json);
      } else {
        return null;
      }
    }
  }
}
