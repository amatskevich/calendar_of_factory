import 'package:calendaroffactory/models/position.dart';

class Shift {
  final String type;
  final String name;
  final List<Position> positions;

  Shift({
    required this.type,
    required this.name,
    required this.positions,
  });
}
