import 'package:calendaroffactory/calendar_screen/work_hours_engine.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TTT', () {
    var shiftPositions = [
      ...Timetables.findByType(TimetableType.EIGHT_4).shifts.firstWhere((element) => element.id == 7).positions
    ];
    List<Position?> monthPositions = [
      null,
      null,
      ...shiftPositions.sublist(1),
      ...shiftPositions,
      ...shiftPositions,
      ...shiftPositions.sublist(0, 2),
      null,
      null,
    ];
    var calculateWorkHoursData = WorkHoursEngine.calculateWorkHoursData(positions: monthPositions, month: 5, year: 2021);

    expect(calculateWorkHoursData.fullHours, '152ч 30мин');
    expect(calculateWorkHoursData.normalHours, '139ч');
    expect(calculateWorkHoursData.overHours, '13ч 30мин');
    expect(calculateWorkHoursData.holidayHours, '25ч 30мин');
  });
}
