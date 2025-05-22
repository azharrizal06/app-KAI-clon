import 'dart:convert';
import 'package:boking_app/app/modules/home/Model/usermodel,dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'token';
  static const String _userKey = 'user';

  /// Simpan token dan user ke SharedPreferences
  static Future<void> saveLoginData(String token, UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  /// Ambil user dari local storage
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);
    if (userString != null) {
      final json = jsonDecode(userString);
      return UserModel.fromJson(json);
    }
    return null;
  }

  /// Ambil token dari local storage
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Hapus token dan user (logout)
  static Future<void> clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  /// Cek apakah user sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    return token != null && token.isNotEmpty;
  }
}
