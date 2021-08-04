import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

import '../models/timetable_type.dart';

class UserInfo with ChangeNotifier {
  List<TimetableShift> _data = [];

  TimetableType? get timetable => _data.isNotEmpty ? _data[0].timetableType : null;

  Shift? get shift => _data.isNotEmpty ? _data[0].shift : null;

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
    var ts = TimetableShift(timetableType: timetableType, timetableName: timetableName, shift: shift,);
    if (_data.contains(ts)) {
      return;
    }
    _data.add(ts);
    notifyListeners();
  }
}

class TimetableShift {
  final TimetableType timetableType;
  final String timetableName;
  final Shift shift;

  TimetableShift({required this.timetableType, required this.timetableName, required this.shift,});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableShift &&
          runtimeType == other.runtimeType &&
          timetableType == other.timetableType &&
          timetableName == other.timetableName &&
          shift == other.shift;

  @override
  int get hashCode => timetableType.hashCode ^ timetableName.hashCode ^ shift.hashCode;
}
