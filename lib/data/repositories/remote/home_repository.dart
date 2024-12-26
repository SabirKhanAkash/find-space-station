import 'package:find_space_station/core/services/api_service.dart';
import 'package:find_space_station/data/models/data_model/data.dart';
import 'package:find_space_station/utils/config/api_endpoint.dart';

class HomeRepository {
  final ApiService apiService;

  HomeRepository({required this.apiService});

  Future<Data>? getIssCurrentLocation(Map<String, dynamic>? body) async {
    dynamic json;
    try {
      json = await apiService.callApi(
          "GET", Uri.parse(ApiEndpoint().issNow), {'Content-Type': 'application/json'}, body);
      if (json == null) throw Exception('Bad Response');
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      return Data.fromJson(json);
    }
  }
}
