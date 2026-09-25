import 'dart:convert';

import 'package:http/http.dart' as http;

import '../local/local_storage.dart';
import '../../core/constants/api_constant.dart';

class HistoryService {
  Future<List<dynamic>> getHistory() async {
    final token = await LocalStorage.getToken();

    final response = await http.get(
      Uri.parse(
        "${ApiConstant.baseUrl}/absen/history"
        "?start=2025-01-01"
        "&end=2026-12-31",
      ),

      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    final result = jsonDecode(response.body);

    return result["data"];
  }
}
