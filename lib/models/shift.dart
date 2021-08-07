import 'package:calendaroffactory/models/position.dart';

class Shift {
  final int id;
  final int timetableId;
  final String name;
  final String defaultName;
  final String description;
  final List<Position> positions;
  final DateTime firstDate;

  Shift({
    required this.id,
    required this.timetableId,
    required this.name,
    required this.defaultName,
    required this.description,
    required this.positions,
    required this.firstDate,
  });
}
