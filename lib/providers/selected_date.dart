import 'package:flutter/material.dart';

class SelectedDate with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  void nextDay() {
    _selectedDate = _selectedDate.add(const Duration(days: 1));
    notifyListeners();
  }

  void beforeDay() {
    _selectedDate = _selectedDate.add(const Duration(days: -1));
    notifyListeners();
  }


  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;
}