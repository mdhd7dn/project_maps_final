import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", token);
    await prefs.reload();
    print("✅ Token stored: $token");
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");
    print("🔍 Fetching token from SharedPreferences: $token");
    return token;
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    print("🗑 Token removed from SharedPreferences");
  }
}
