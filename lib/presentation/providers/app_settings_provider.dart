import 'package:flutter/material.dart';
import 'package:wasl_iman/core/constants/storage_keys.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';

class AppSettingsProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  ThemeMode _themeMode = ThemeMode.light;
  bool _notificationsEnabled = true;
  bool _onboardingSeen = false;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get onboardingSeen => _onboardingSeen;

  Future<void> loadSettings() async {
    final storage = LocalStorageService.instance;
    final languageCode = storage.getString(StorageKeys.languageCode);
    final mode = storage.getString(StorageKeys.themeMode);

    _locale = Locale(languageCode ?? 'ar');
    _themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    _notificationsEnabled = storage.getBool(StorageKeys.notificationsEnabled) ?? true;
    _onboardingSeen = storage.getBool(StorageKeys.onboardingSeen) ?? false;
    notifyListeners();
  }

  Future<void> setLanguage(String code) async {
    _locale = Locale(code);
    await LocalStorageService.instance.setString(StorageKeys.languageCode, code);
    notifyListeners();
  }

  Future<void> toggleTheme(bool dark) async {
    _themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    await LocalStorageService.instance.setString(StorageKeys.themeMode, dark ? 'dark' : 'light');
    notifyListeners();
  }

  Future<void> toggleNotifications(bool enabled) async {
    _notificationsEnabled = enabled;
    await LocalStorageService.instance.setBool(StorageKeys.notificationsEnabled, enabled);
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _onboardingSeen = true;
    await LocalStorageService.instance.setBool(StorageKeys.onboardingSeen, true);
    notifyListeners();
  }
}
