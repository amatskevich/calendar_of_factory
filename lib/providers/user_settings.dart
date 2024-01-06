import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings with ChangeNotifier {
  static const smellChabor = 'Фиолетовая';
  static const vasilky = 'Синяя';
  static const longLife = 'Красная';
  static final Map<String, ThemeData> themes = {
    smellChabor: ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.purple.shade400,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.purple.shade400,
      ),
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
      primaryColor: Colors.red.shade400,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.red.shade400,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFfee8e6),
    ),
  };

  static const _themeKey = 'by.matskevich.calendaroffactory.theme';
  static const _carouselKey = 'by.matskevich.calendaroffactory.carousel';

  String _currentThemeName;
  String _currentTimetableCarousel;

  String get currentThemeName => _currentThemeName;

  String get currentTimetableCarousel => _currentTimetableCarousel;

  UserSettings(this._currentThemeName, this._currentTimetableCarousel);

  void changeTheme(String theme) {
    _currentThemeName = theme;
    SharedPreferences.getInstance().then((prefs) => prefs.setString(_themeKey, theme));
    notifyListeners();
  }

  void changeTimetableCarousel(String timetable) {
    _currentTimetableCarousel = timetable;
    SharedPreferences.getInstance().then((prefs) => prefs.setString(_carouselKey, timetable));
    notifyListeners();
  }

  static Future<String> retrieveThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? themes.keys.first;
  }

  static Future<String> retrieveCarouselFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_carouselKey) ?? "";
  }

  ThemeData getUserTheme() {
    return themes[_currentThemeName] ?? themes[smellChabor]!;
  }
}
