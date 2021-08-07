import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('timetable 12: Test calculation position for day', () {
    var timetable12 = Timetables.findByType(TimetableType.TWELFTH_30);
    var day = DateTime(2021, 7, 24);

    test('Shift A', () {
      var shift = timetable12.shifts.firstWhere((element) => element.defaultName == 'А');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ЗАВТРА С УТРА');
    });

    test('Shift V', () {
      var shift = timetable12.shifts.firstWhere((element) => element.defaultName == 'В');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '2-я С УТРА');
    });

    test('Shift G', () {
      var shift = timetable12.shifts.firstWhere((element) => element.defaultName == 'Г');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'В НОЧЬ');
    });

    test('Shift B', () {
      var shift = timetable12.shifts.firstWhere((element) => element.defaultName == 'Б');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ОТСЫПНОЙ');
    });
  });

  group('timetable 8: Test calculation position for day', () {
    var timetable8 = Timetables.findByType(TimetableType.EIGHT_4);
    var day = DateTime(2021, 7, 25);

    test('Shift A', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == 'А');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ОТСЫПНОЙ');
    });

    test('Shift B', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == 'Б');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, 'ВЫХОДНОЙ');
    });

    test('Shift V', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == 'В');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '2-я С 4-х');
    });

    test('Shift G', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == 'Г');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-я С УТРА');
    });

    test('Shift D', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == 'Д');
      print(shift);
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-я НОЧЬ');
    });
  });

  group('timetable DAY: Test calculation position for day', () {
    var timetable8 = Timetables.findByType(TimetableType.DAY_15);
    var day = DateTime(2021, 7, 24);

    test('Shift 1', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == '1 бригада');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-й ВЫХОДНОЙ');
    });

    test('Shift 2', () {
      var shift = timetable8.shifts.firstWhere((element) => element.defaultName == '2 бригада');
      var resultPosition = CalendarEngine.calculatePositionForDay(day: day, shift: shift);

      expect(resultPosition.name, '1-й ДЕНЬ');
    });
  });
}
