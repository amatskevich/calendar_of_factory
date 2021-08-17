import 'timetable_type.dart';

class Timetable {
  final int id;
  final TimetableType type;
  final String name;
  final String defaultName;
  final String timetableNumber;

  const Timetable({
    required this.id,
    required this.type,
    required this.name,
    required this.defaultName,
    required this.timetableNumber,
  });
}
