import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('timetable 12: Test calculation position for day', () {
    var shifts = Timetables().getShiftsByTimetableType(TimetableType.TWELFTH_30);
    var day = DateTime(2021, 7, 24);

    test('Shift A', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'А');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ЗАВТРА С УТРА');
    });

    test('Shift V', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'В');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '2-я С УТРА');
    });

    test('Shift G', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'Г');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'В НОЧЬ');
    });

    test('Shift B', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'Б');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ОТСЫПНОЙ');
    });
  });

  group('timetable 8: Test calculation position for day', () {
    var shifts = Timetables().getShiftsByTimetableType(TimetableType.EIGHT_4);
    var day = DateTime(2021, 7, 25);

    test('Shift A', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'А');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ОТСЫПНОЙ');
    });

    test('Shift B', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'Б');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ВЫХОДНОЙ');
    });

    test('Shift V', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'В');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '2-я С 4-х');
    });

    test('Shift G', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'Г');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-я С УТРА');
    });

    test('Shift D', () {
      var shift = shifts.firstWhere((element) => element.defaultName == 'Д');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-я НОЧЬ');
    });
  });

  group('timetable DAY: Test calculation position for day', () {
    var shifts = Timetables().getShiftsByTimetableType(TimetableType.DAY_15);
    var day = DateTime(2021, 7, 24);

    test('Shift 1', () {
      var shift = shifts.firstWhere((element) => element.defaultName == '1 бригада');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-й ВЫХОДНОЙ');
    });

    test('Shift 2', () {
      var shift = shifts.firstWhere((element) => element.defaultName == '2 бригада');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-й ДЕНЬ');
    });
  });

  test('Test month', () {
    var shifts = Timetables().getShiftsByTimetableType(TimetableType.EIGHT_4);
    var day = DateTime(2021, 8, 25);
    var shift = shifts.firstWhere((element) => element.defaultName == 'Б');

    var result = CalendarEngine.calculatePositionsForMonth(day: day, shift: shift);
    var index = 0;
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++]!.name, '2-я НОЧЬ');
    expect(result[index++]!.name, 'ОТСЫПНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С 4-х');
    expect(result[index++]!.name, '2-я С 4-х');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С УТРА');
    expect(result[index++]!.name, '2-я С УТРА');
    expect(result[index++]!.name, '1-я НОЧЬ');
    expect(result[index++]!.name, '2-я НОЧЬ');
    expect(result[index++]!.name, 'ОТСЫПНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С 4-х');
    expect(result[index++]!.name, '2-я С 4-х');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С УТРА');
    expect(result[index++]!.name, '2-я С УТРА');
    expect(result[index++]!.name, '1-я НОЧЬ');
    expect(result[index++]!.name, '2-я НОЧЬ');
    expect(result[index++]!.name, 'ОТСЫПНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С 4-х');
    expect(result[index++]!.name, '2-я С 4-х');
    expect(result[index++]!.name, 'ВЫХОДНОЙ');
    expect(result[index++]!.name, '1-я С УТРА');
    expect(result[index++]!.name, '2-я С УТРА');
    expect(result[index++]!.name, '1-я НОЧЬ');
    expect(result[index++]!.name, '2-я НОЧЬ');
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index++], null);
    expect(result[index], null);
  });
}
