import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._privateConstructor();

  static final SharedPrefService _instance =
      SharedPrefService._privateConstructor();

  static SharedPrefService get instance => _instance;

  static const _localeKey = 'app_locale';
  String? _currentLocale;

  Future<void> setLocale(String localeCode) async {
    _currentLocale = localeCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, localeCode);
  }

  Future<String> getLocale() async {
    if (_currentLocale != null) {
      return _currentLocale!;
    }
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    if (localeCode == null) return "en";
    _currentLocale = localeCode;
    return localeCode;
  }

  String get currentLocale {
    _currentLocale ??= "en";
    return _currentLocale!;
  }

  Future<void> clearLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
  }

  DateFormat dateFormat(String pattern) {
    return DateFormat(pattern, _currentLocale ?? "en");
  }

  String getLocalizedTime() {
    final now = DateTime.now();
    final format = DateFormat.jm(_currentLocale ?? "en");
    return format.format(now);
  }
}
