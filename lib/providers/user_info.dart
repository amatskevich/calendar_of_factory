import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

import '../models/timetable_type.dart';

class UserInfo with ChangeNotifier {
  List<TimetableShift> data = [];

  TimetableType? get timetable => data.isNotEmpty ? data[0].timetableType : null;

  Shift? get shift => data.isNotEmpty ? data[0].shifts[0] : null;

  String? getShiftName() => shift?.name;

  Position? getPositionByIndex(int index) => shift?.positions[index];

  void addTimetableShift({
    required TimetableType timetableType,
    required String timetableName,
    required Shift shift,
  }) {
    var timetableShift = data.firstWhere(
      (element) => element.timetableType == timetableType,
      orElse: () {
        var ts = TimetableShift(timetableType: timetableType, timetableName: timetableName);
        data.add(ts);
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
