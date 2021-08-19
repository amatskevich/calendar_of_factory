import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings with ChangeNotifier {
  static const themes = const ['Пахне чабор', 'Василки', 'Жыве'];
  static const _key = 'by.matskevich.calendaroffactory.theme';

  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, theme);
  }

  Future<String> retrieveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? themes[0];
  }
}