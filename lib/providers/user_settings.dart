import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings with ChangeNotifier {
  static const smellChabor = 'Фиолетовая';
  static const vasilky = 'Синяя';
  static const longLife = 'Красная';
  static final Map<String, ThemeData> themes = {
    smellChabor: ThemeData(
      primarySwatch: Colors.purple,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFf3e4f5),
    ),
    vasilky: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFe3f2fd),
    ),
    longLife: ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFfee8e6),
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
    return themes[_currentThemeName] ?? themes[smellChabor]!;
  }
}
