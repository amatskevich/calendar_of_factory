import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:flutter/material.dart';

class Timetables with ChangeNotifier {
  
  static const colorInDay = const Color(0xFFFFBABA);
  static const colorAfterNight = const Color(0xFFBBFFBA);
  static const colorInNight = const Color(0xFFBACFFF);
  static const colorInEvening = const Color(0xFFF1BAFF);
  static const colorDayOff = const Color(0xFFFFFFFF);
  
  static final List<Timetable> _timetables = [
    Timetable(
      type: TimetableType.TWELFTH_30,
      description: "График №30",
      shifts: [
        Shift(type: 'А', name: 'А', positions: twelfth30Positions, firstDate: DateTime(2016, 2, 26)),
        Shift(type: 'В', name: 'В', positions: twelfth30Positions, firstDate: DateTime(2016, 2, 24)),
        Shift(type: 'Г', name: 'Г', positions: twelfth30Positions, firstDate: DateTime(2016, 2, 22)),
        Shift(type: 'Б', name: 'Б', positions: twelfth30Positions, firstDate: DateTime(2016, 2, 20)),
      ],
    ),
    Timetable(
      type: TimetableType.EIGHT_4,
      description: "График №4",
      shifts: [
        Shift(type: 'А', name: 'А', positions: eight4Positions, firstDate: DateTime(2016, 2, 20)),
        Shift(type: 'Б', name: 'Б', positions: eight4Positions, firstDate: DateTime(2016, 2, 28)),
        Shift(type: 'В', name: 'В', positions: eight4Positions, firstDate: DateTime(2016, 2, 26)),
        Shift(type: 'Г', name: 'Г', positions: eight4Positions, firstDate: DateTime(2016, 2, 24)),
        Shift(type: 'Д', name: 'Д', positions: eight4Positions, firstDate: DateTime(2016, 2, 22)),
      ],
    ),
    Timetable(
      type: TimetableType.DAY_15,
      description: "График №15",
      shifts: [
        Shift(type: '1 бригада', name: '1 бригада', positions: day15Positions, firstDate: DateTime(2016, 2, 22)),
        Shift(type: '2 бригада', name: '2 бригада', positions: day15Positions, firstDate: DateTime(2016, 2, 20)),
      ],
    ),
  ];

  List<Timetable> get timetables => [..._timetables];

  static Timetable findByType(TimetableType type) {
    return _timetables.firstWhere((pr) => pr.type == type);
  }

  static List<Position> get twelfth30Positions => [
        Position(
            name: '1-я С УТРА',
            sign: '8',
            color: colorInDay,
            workHours: 12,
            description: 'В день'),
        Position(
            name: '2-я С УТРА',
            sign: '8',
            color: colorInDay,
            workHours: 12,
            description: 'В день'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'В НОЧЬ',
            sign: '20',
            color: colorInNight,
            workHours: 4,
            description: 'В ночь'),
        Position(
            name: 'С НОЧИ В НОЧЬ',
            sign: '20',
            color: colorInNight,
            workHours: 12,
            description: 'В ночь'),
        Position(
            name: 'ОТСЫПНОЙ',
            sign: 'О',
            color: colorAfterNight,
            workHours: 8,
            description: 'Отсыпной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'ЗАВТРА С УТРА',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
      ];

  static List<Position> get eight4Positions => [
        Position(
            name: '1-я НОЧЬ',
            sign: '24',
            color: colorInNight,
            workHours: 0.5,
            description: 'В ночь'),
        Position(
            name: '2-я НОЧЬ',
            sign: '24',
            color: colorInNight,
            workHours: 8.5,
            description: 'В ночь'),
        Position(
            name: 'ОТСЫПНОЙ',
            sign: 'О',
            color: colorAfterNight,
            workHours: 8,
            description: 'Отсыпной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-я С 4-х',
            sign: '16',
            color: colorInEvening,
            workHours: 7.5,
            description: 'Вечерняя'),
        Position(
            name: '2-я С 4-х',
            sign: '16',
            color: colorInEvening,
            workHours: 7.5,
            description: 'Вечерняя'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-я С УТРА',
            sign: '8',
            color: colorInDay,
            workHours: 8,
            description: 'С утра'),
        Position(
            name: '2-я С УТРА',
            sign: '8',
            color: colorInDay,
            workHours: 8,
            description: 'С утра'),
      ];

  static List<Position> get day15Positions => [
        Position(
            name: '2-й ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-й ДЕНЬ',
            sign: '8',
            color: colorInDay,
            workHours: 11.25,
            description: 'Рабочий'),
        Position(
            name: '2-й ДЕНЬ',
            sign: '8',
            color: colorInDay,
            workHours: 11.25,
            description: 'Рабочий'),
        Position(
            name: '1-й ВЫХОДНОЙ',
            sign: '*',
            color: colorDayOff,
            workHours: 0,
            description: 'Выходной'),
      ];
}