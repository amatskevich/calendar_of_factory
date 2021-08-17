import 'package:calendaroffactory/models/position.dart';

import 'timetable.dart';

class Shift {
  final int id;
  final Timetable timetable;
  final String defaultName;
  final List<Position> positions;
  final DateTime firstDate;
  String name;
  String description;
  bool showOnMainScreen;

  Shift({
    required this.id,
    required this.timetable,
    required this.defaultName,
    required this.positions,
    required this.firstDate,
    required this.name,
    this.description = '',
    this.showOnMainScreen = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Shift && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
