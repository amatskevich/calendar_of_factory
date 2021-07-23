import 'shift.dart';
import 'timetable_type.dart';

class Timetable {
  final TimetableType type;
  final String description;
  final List<Shift> shifts;

  Timetable({
    required this.type,
    required this.description,
    required this.shifts,
  });
}
