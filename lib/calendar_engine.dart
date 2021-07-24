import 'package:calendaroffactory/models/position.dart';

import 'models/shift.dart';

class CalendarEngine {

  static Position calculatePositionForDay({
    required DateTime day,
    required Shift shift,
  }) {
    var amountDays = daysSinceFirstDay(shift.firstDate, day);
    var index = amountDays % shift.positions.length;
    return shift.positions[index];
  }

  static List<Position> calculatePositionsForMonth({
    required DateTime day,
    required Shift shift,
  }) {
    return [...shift.positions];
  }

  static int daysSinceFirstDay(DateTime firstDate, DateTime currentDate) {
    var from = DateTime(firstDate.year, firstDate.month, firstDate.day);
    var to = DateTime(currentDate.year, currentDate.month, currentDate.day);
    return (to.difference(from).inHours / 24).round();
  }
}
