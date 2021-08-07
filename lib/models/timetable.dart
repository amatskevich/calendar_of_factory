import 'shift.dart';
import 'timetable_type.dart';

class Timetable {
  final int id;
  final TimetableType type;
  final String name;
  final String defaultName;
  final String timetableNumber;
  final List<Shift> shifts;

  Timetable({
    required this.id,
    required this.type,
    required this.name,
    required this.defaultName,
    required this.timetableNumber,
    required this.shifts,
  });
}
