import 'package:calendaroffactory/models/position.dart';

import 'models/shift.dart';

class CalendarEngine {

  static Position calculatePositionForDay({
    required DateTime day,
    required Shift shift,
  }) {
    var index = _calculateIndex(shift.firstDate, shift.positions.length, day);
    return shift.positions[index];
  }

  static int _calculateIndex(DateTime firstDate, int positionsLength, DateTime currentDate) {
    var from = DateTime(firstDate.year, firstDate.month, firstDate.day);
    var to = DateTime(currentDate.year, currentDate.month, currentDate.day);
    var amountDays = (to.difference(from).inHours / 24).round();
    return amountDays % positionsLength;
  }

  static List<Position?> calculatePositionsForMonth({
    required DateTime day,
    required Shift shift,
  }) {
    List<Position?> result = [];
    var firstDayOfMonth = DateTime(day.year, day.month, 1);
    var lastDayOfMonth = DateTime(day.year, day.month + 1, 0);
    var weekdayStart = firstDayOfMonth.weekday;
    while(weekdayStart != 1) {
      result.add(null);
      weekdayStart--;
    }
    var positionIndex = _calculateIndex(shift.firstDate, shift.positions.length, firstDayOfMonth);
    var amountDays = lastDayOfMonth.day;
    final lastIndex = shift.positions.length - 1;
    while(amountDays > 0) {
      result.add(shift.positions[positionIndex]);
      positionIndex = positionIndex < lastIndex ? positionIndex + 1 : 0;
      amountDays--;
    }
    var weekdayEnd = lastDayOfMonth.weekday;
    while(weekdayEnd != 7) {
      result.add(null);
      weekdayEnd++;
    }
    return result;
  }
}
