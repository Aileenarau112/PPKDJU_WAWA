import 'dart:convert';
import 'package:http/http.dart' as http;

import '../local/local_storage.dart';
import '../../core/constants/api_constant.dart';

class AbsenService {
  Future<Map<String, dynamic>> checkIn({
    required double latitude,
    required double longitude,
  }) async {
    final token = await LocalStorage.getToken();

    final response = await http.post(
      Uri.parse("${ApiConstant.baseUrl}/absen/check-in"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "check_in_lat": latitude.toString(),
        "check_in_lng": longitude.toString(),
        "check_in_address": "Lokasi pengguna",
        "status": "masuk",
      }),
    );

    return jsonDecode(response.body);
  }

  // ==========================
  // ABSEN PULANG / CHECK OUT
  // ==========================

  Future<Map<String, dynamic>> checkOut({
    required double latitude,
    required double longitude,
  }) async {
    final token = await LocalStorage.getToken();

    final response = await http.post(
      Uri.parse("${ApiConstant.baseUrl}/absen/check-out"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "check_out_lat": latitude.toString(),
        "check_out_lng": longitude.toString(),
        "check_out_location": "$latitude,$longitude",
        "check_out_address": "Lokasi pengguna",
      }),
    );

    return jsonDecode(response.body);
  }
}