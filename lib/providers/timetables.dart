import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:flutter/material.dart';

class Timetables with ChangeNotifier {
  static final List<Timetable> _timetables = [
    Timetable(
      type: TimetableType.TWELFTH_30,
      description: "График №30",
      shifts: [
        Shift(type: 'А', name: 'А', positions: twelfth30Positions),
        Shift(type: 'В', name: 'В', positions: twelfth30Positions),
        Shift(type: 'Г', name: 'Г', positions: twelfth30Positions),
        Shift(type: 'Б', name: 'Б', positions: twelfth30Positions),
      ],
    ),
    Timetable(
      type: TimetableType.EIGHT_4,
      description: "График №4",
      shifts: [
        Shift(type: 'А', name: 'А', positions: eight4Positions),
        Shift(type: 'Б', name: 'Б', positions: eight4Positions),
        Shift(type: 'В', name: 'В', positions: eight4Positions),
        Shift(type: 'Г', name: 'Г', positions: eight4Positions),
        Shift(type: 'Д', name: 'Д', positions: eight4Positions),
      ],
    ),
    Timetable(
      type: TimetableType.DAY_15,
      description: "График №15",
      shifts: [
        Shift(type: '1 бригада', name: '1 бригада', positions: day15Positions),
        Shift(type: '2 бригада', name: '2 бригада', positions: day15Positions),
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
            color: Colors.amber,
            workHours: 12,
            description: 'В день'),
        Position(
            name: '2-я С УТРА',
            sign: '8',
            color: Colors.cyanAccent,
            workHours: 12,
            description: 'В день'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'В НОЧЬ',
            sign: '20',
            color: Colors.cyanAccent,
            workHours: 4,
            description: 'В ночь'),
        Position(
            name: 'С НОЧИ В НОЧЬ',
            sign: '20',
            color: Colors.cyanAccent,
            workHours: 12,
            description: 'В ночь'),
        Position(
            name: 'ОТСЫПНОЙ',
            sign: 'О',
            color: Colors.cyanAccent,
            workHours: 8,
            description: 'Отсыпной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'ЗАВТРА С УТРА',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
      ];

  static List<Position> get eight4Positions => [
        Position(
            name: '1-я НОЧЬ',
            sign: '24',
            color: Colors.cyanAccent,
            workHours: 0.5,
            description: 'В ночь'),
        Position(
            name: '2-я НОЧЬ',
            sign: '24',
            color: Colors.cyanAccent,
            workHours: 8.5,
            description: 'В ночь'),
        Position(
            name: 'ОТСЫПНОЙ',
            sign: 'О',
            color: Colors.cyanAccent,
            workHours: 8,
            description: 'Отсыпной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-я С 4-х',
            sign: '16',
            color: Colors.cyanAccent,
            workHours: 7.5,
            description: 'Вечерняя'),
        Position(
            name: '2-я С 4-х',
            sign: '16',
            color: Colors.cyanAccent,
            workHours: 7.5,
            description: 'Вечерняя'),
        Position(
            name: 'ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-я С УТРА',
            sign: '8',
            color: Colors.cyanAccent,
            workHours: 8,
            description: 'С утра'),
        Position(
            name: '2-я С УТРА',
            sign: '8',
            color: Colors.cyanAccent,
            workHours: 8,
            description: 'С утра'),
      ];

  static List<Position> get day15Positions => [
        Position(
            name: '2-й ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
        Position(
            name: '1-й ДЕНЬ',
            sign: '8',
            color: Colors.cyanAccent,
            workHours: 11.25,
            description: 'Рабочий'),
        Position(
            name: '2-й ДЕНЬ',
            sign: '8',
            color: Colors.cyanAccent,
            workHours: 11.25,
            description: 'Рабочий'),
        Position(
            name: '1-й ВЫХОДНОЙ',
            sign: '*',
            color: Colors.cyanAccent,
            workHours: 0,
            description: 'Выходной'),
      ];
}
