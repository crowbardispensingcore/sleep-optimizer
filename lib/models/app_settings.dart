import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings with ChangeNotifier {
  SharedPreferences? _preferences;

  bool _isFirstLaunch = true;
  bool _alarmIsEnabled = false;

  bool get isFirstLaunch => _isFirstLaunch;

  AppSettings() {
    _loadSettingsFromPrefs();
  }

  Future<void> _initializePrefs() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _loadSettingsFromPrefs() async {
    await _initializePrefs();
    _isFirstLaunch = _preferences!.getBool('isFirstLaunch') ?? true;
    _alarmIsEnabled = _preferences!.getBool('alarmIsEnabled') ?? false;

    notifyListeners();
  }

  Future<void> setIsFirstLaunch(bool option) async {
    _isFirstLaunch = option;
    await _initializePrefs();
    _preferences!.setBool('isFirstLaunch', option);
    notifyListeners();
  }
}
