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

  void removeTimetableShift(TimetableShift shift) {
    _data.remove(shift);
    notifyListeners();
  }

  void addTimetableShift({
    required TimetableType timetableType,
    required String timetableName,
    required String timetableNumber,
    required Shift shift,
  }) {
    var ts = TimetableShift(
      timetableType: timetableType,
      timetableName: timetableName,
      timetableNumber: timetableNumber,
      shift: shift,
    );
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
  final String timetableNumber;
  final Shift shift;

  TimetableShift({
    required this.timetableType,
    required this.timetableName,
    required this.timetableNumber,
    required this.shift,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableShift &&
          runtimeType == other.runtimeType &&
          timetableType == other.timetableType &&
          timetableName == other.timetableName &&
          timetableNumber == other.timetableNumber &&
          shift == other.shift;

  @override
  int get hashCode => timetableType.hashCode ^ timetableName.hashCode ^ timetableNumber.hashCode ^ shift.hashCode;
}
