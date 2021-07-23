import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {

  TimetableType _timetable = TimetableType.TWELFTH_30;
  String _shift = 'А';

  TimetableType get timetable => _timetable;

  String get shift => _shift;
}