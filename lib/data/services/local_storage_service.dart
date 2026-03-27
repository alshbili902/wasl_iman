import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService instance = LocalStorageService._();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) => _prefs.getString(key);
  int? getInt(String key) => _prefs.getInt(key);
  bool? getBool(String key) => _prefs.getBool(key);

  Future<void> setString(String key, String value) => _prefs.setString(key, value);
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  Future<void> setMap(String key, Map<String, dynamic> value) => setString(key, jsonEncode(value));

  Map<String, dynamic>? getMap(String key) {
    final raw = getString(key);
    if (raw == null || raw.isEmpty) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }
}
