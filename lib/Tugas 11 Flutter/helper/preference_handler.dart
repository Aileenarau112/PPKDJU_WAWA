import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _keySessionActive = 'user_session_active_status';

  // Menyimpan status login
  static Future<void> saveUserSession(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySessionActive, isLoggedIn);
  }

  // Mengecek status login
  static Future<bool> checkUserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keySessionActive) ?? false;
  }

  // Menghapus sesi (Logout)
  static Future<void> clearUserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keySessionActive);
  }
}