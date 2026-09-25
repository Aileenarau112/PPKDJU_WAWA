import 'dart:convert';

import 'package:http/http.dart' as http;

import '../local/local_storage.dart';
import '../../core/constants/api_constant.dart';

class ProfileService {
  Future<Map<String, dynamic>> getProfile() async {
    final token = await LocalStorage.getToken();

    final response = await http.get(
      Uri.parse("${ApiConstant.baseUrl}/profile"),

      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    final result = jsonDecode(response.body);

    return result["data"];
  }

  Future<Map<String, dynamic>> updateProfile(String name) async {
    final token = await LocalStorage.getToken();

    final response = await http.put(
      Uri.parse("${ApiConstant.baseUrl}/profile"),

      headers: {
        "Accept": "application/json",

        "Authorization": "Bearer $token",

        "Content-Type": "application/json",
      },

      body: jsonEncode({"name": name}),
    );

    return jsonDecode(response.body)["data"];
  }
}
