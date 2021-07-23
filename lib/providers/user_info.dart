import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import '../models/timetable_type.dart';
import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {

  TimetableType _timetable = TimetableType.TWELFTH_30;
  Shift _shift = Timetables.findByType(TimetableType.TWELFTH_30).shifts.firstWhere((element) => element.name == 'А');

  TimetableType get timetable => _timetable;

  Shift get shift => _shift;

  String getShiftName() => _shift.name;

  Position getPositionByIndex(int index) => _shift.positions[index];
}