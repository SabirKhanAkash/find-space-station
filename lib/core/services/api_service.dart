import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic>? callApi(String method, Uri endpoint, dynamic headers, [dynamic body]) async {
    try {
      if (method == "GET") {
        final response = await http.get(endpoint, headers: headers);
        return jsonDecode(response.body);
      } else if (method == "POST") {
        final response = await http.post(endpoint, headers: headers, body: jsonEncode(body));
        return jsonDecode(response.body);
      } else if (method == "PUT") {
        final response = await http.put(endpoint, headers: headers, body: jsonEncode(body));
        return jsonDecode(response.body);
      } else if (method == "PATCH") {
        final response = await http.patch(endpoint, headers: headers, body: jsonEncode(body));
        return jsonDecode(response.body);
      } else {
        throw Exception('Invalid Method');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
