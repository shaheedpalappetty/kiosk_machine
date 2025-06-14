import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPrefService {
  SharedPrefService._privateConstructor();

  static final SharedPrefService _instance = SharedPrefService._privateConstructor();

  static SharedPrefService get instance => _instance;

  static const _localeKey = 'app_locale';

  Future<void> setLocale(String localeCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, localeCode);
  }

  Future<String> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    if (localeCode == null) return "en";
    return localeCode;
  }

  Future<void> clearLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
  }
}
