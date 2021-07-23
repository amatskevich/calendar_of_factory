import 'package:calendaroffactory/models/position.dart';

import 'models/shift.dart';

class CalendarEngine {
  static Position calculatePositionForDay({
    required DateTime day,
    required Shift shift,
  }) {
    return shift.positions[0];
  }
}
