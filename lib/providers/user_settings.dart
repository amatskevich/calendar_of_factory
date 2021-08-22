import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings with ChangeNotifier {
  static final Map<String, ThemeData> themes = {
    'Пахне чабор': ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.amber,
      brightness: Brightness.light,
    ),
    'Василки': ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.amber,
      brightness: Brightness.light,
    ),
    'Жыве': ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.amber,
      brightness: Brightness.light,
    ),
  };

  static const _key = 'by.matskevich.calendaroffactory.theme';

  String _currentThemeName;

  get currentThemeName => _currentThemeName;

  UserSettings(this._currentThemeName);

  void changeTheme(String theme) {
    _currentThemeName = theme;
    SharedPreferences.getInstance().then((prefs) => prefs.setString(_key, theme));
    notifyListeners();
  }

  static Future<String> retrieveThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? themes.keys.first;
  }

  ThemeData getUserTheme() {
    return themes[_currentThemeName]!;
  }
}
