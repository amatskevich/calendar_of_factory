import 'package:calendaroffactory/models/position.dart';

class Shift {
  final String type;
  final String name;
  final List<Position> positions;
  final DateTime firstDate;

  Shift({
    required this.type,
    required this.name,
    required this.positions,
    required this.firstDate,
  });
}
