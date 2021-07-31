import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

import '../models/timetable_type.dart';

class UserInfo with ChangeNotifier {
  List<TimetableShift> _data = [];

  TimetableType? get timetable => _data.isNotEmpty ? _data[0].timetableType : null;

  Shift? get shift => _data.isNotEmpty ? _data[0].shifts[0] : null;

  String? getShiftName() => shift?.name;

  Position? getPositionByIndex(int index) => shift?.positions[index];

  List<TimetableShift> get data => [..._data];

  void replaceSingleTimetableShift({
    required TimetableType timetableType,
    required String timetableName,
    required Shift shift,
  }) {
    _data.clear();
    addTimetableShift(timetableType: timetableType, timetableName: timetableName, shift: shift);
  }

  void addTimetableShift({
    required TimetableType timetableType,
    required String timetableName,
    required Shift shift,
  }) {
    var timetableShift = _data.firstWhere(
      (element) => element.timetableType == timetableType,
      orElse: () {
        var ts = TimetableShift(timetableType: timetableType, timetableName: timetableName);
        _data.add(ts);
        return ts;
      },
    );
    if (timetableShift.shifts.contains(shift)) {
      return;
    }
    timetableShift.shifts.add(shift);
    notifyListeners();
  }
}

class TimetableShift {
  final TimetableType timetableType;
  final String timetableName;
  final List<Shift> shifts = [];

  TimetableShift({required this.timetableType, required this.timetableName});
}
