import 'dart:collection';

import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/models/timetable_type.dart';
import 'package:calendaroffactory/persistent/custom_shift_data.dart';
import 'package:calendaroffactory/persistent/database_service.dart';
import 'package:flutter/material.dart';

class Timetables with ChangeNotifier {
  static const colorInDay = const Color(0xFFFFD3D3);
  static const colorAfterNight = const Color(0xFFe9ffd3);
  static const colorInNight = const Color(0xFFd3ffff);
  static const colorInEvening = const Color(0xFFe9d3ff);
  static const colorDayOff = const Color(0xFFFFFFFF);

  static const _timetableTwelfth30 = const Timetable(
    id: 1,
    type: TimetableType.TWELFTH_30,
    name: '12ч смены',
    defaultName: '12ч смены',
    timetableNumber: "График №30",
  );

  static const _timetableEight4 = const Timetable(
    id: 2,
    type: TimetableType.EIGHT_4,
    name: '8ч смены',
    defaultName: '8ч смены',
    timetableNumber: "График №4",
  );

  static const _timetableDay15 = const Timetable(
    id: 3,
    type: TimetableType.DAY_15,
    name: '2 через 2',
    defaultName: '2 через 2',
    timetableNumber: "График №15",
  );

  final databaseService = DatabaseService();

  Timetables() {
    _loadShiftData();
  }

  void _loadShiftData() {
    databaseService.getAllShiftDatas().then((datas) {
      datas.forEach((data) {
        var shift = _shifts.firstWhere((s) => s.id == data.id);
        shift.name = data.name;
        shift.description = data.description;
        shift.showOnMainScreen = data.show;
      });
      if (datas.isNotEmpty) {
        notifyListeners();
      }
    });
  }

  List<Timetable> get timetables => [_timetableTwelfth30, _timetableEight4, _timetableDay15];

  List<Shift> get shifts => [..._shifts];

  List<Shift> getShiftsByTimetableType(TimetableType type) {
    return [..._shifts.where((element) => element.timetable.type == type).toList()];
  }

  LinkedHashMap<Timetable, List<Shift>> getGroupedShifts({bool mainScreen = false}) {
    var filteredShifts = mainScreen ? [..._shifts.where((element) => element.showOnMainScreen).toList()] : [..._shifts];
    LinkedHashMap<Timetable, List<Shift>> result = LinkedHashMap();
    filteredShifts.forEach((element) {
      var list = result.putIfAbsent(element.timetable, () => []);
      list.add(element);
    });
    return result;
  }

  void updateShift(Shift shift) {
    var original = _shifts.firstWhere((element) => element.id == shift.id);
    original.name = shift.name;
    original.description = shift.description;
    original.showOnMainScreen = shift.showOnMainScreen;
    databaseService.upsertShiftData(
      CustomShiftData(
        shift.id,
        shift.name,
        shift.description,
        shift.showOnMainScreen,
      ),
    );
    notifyListeners();
  }

  void showShiftsOnMainScreen(Set<int> shiftIds) {
    _shifts.where((element) => shiftIds.contains(element.id)).forEach((shift) {
      shift.showOnMainScreen = true;
      databaseService.upsertShiftData(
        CustomShiftData(
          shift.id,
          shift.name,
          shift.description,
          shift.showOnMainScreen,
        ),
      );
    });
    notifyListeners();
  }

  void showShiftOnMainScreen(int shiftId) {
    _shifts.where((element) => shiftId == element.id).forEach((shift) {
      shift.showOnMainScreen = true;
      databaseService.upsertShiftData(
        CustomShiftData(
          shift.id,
          shift.name,
          shift.description,
          shift.showOnMainScreen,
        ),
      );
    });
    notifyListeners();
  }

  void hideShiftOnMainScreen(int shiftId) {
    _shifts.where((element) => element.id == shiftId).forEach((shift) {
      shift.showOnMainScreen = false;
      databaseService.upsertShiftData(
        CustomShiftData(
          shift.id,
          shift.name,
          shift.description,
          shift.showOnMainScreen,
        ),
      );
    });
    notifyListeners();
  }

  final List<Shift> _shifts = [
    Shift(
      id: 1,
      timetable: _timetableTwelfth30,
      name: 'А',
      defaultName: 'А',
      description: '',
      positions: _twelfth30Positions,
      firstDate: DateTime(2016, 2, 26),
    ),
    Shift(
      id: 2,
      timetable: _timetableTwelfth30,
      defaultName: 'В',
      name: 'В',
      description: '',
      positions: _twelfth30Positions,
      firstDate: DateTime(2016, 2, 24),
    ),
    Shift(
      id: 3,
      timetable: _timetableTwelfth30,
      defaultName: 'Г',
      name: 'Г',
      description: '',
      positions: _twelfth30Positions,
      firstDate: DateTime(2016, 2, 22),
    ),
    Shift(
      id: 4,
      timetable: _timetableTwelfth30,
      defaultName: 'Б',
      name: 'Б',
      description: '',
      positions: _twelfth30Positions,
      firstDate: DateTime(2016, 2, 20),
    ),
    Shift(
      id: 5,
      timetable: _timetableEight4,
      defaultName: 'А',
      name: 'А',
      description: '',
      positions: _eight4Positions,
      firstDate: DateTime(2016, 2, 20),
    ),
    Shift(
      id: 6,
      timetable: _timetableEight4,
      defaultName: 'Б',
      name: 'Б',
      description: '',
      positions: _eight4Positions,
      firstDate: DateTime(2016, 2, 28),
    ),
    Shift(
      id: 7,
      timetable: _timetableEight4,
      defaultName: 'В',
      name: 'В',
      description: '',
      positions: _eight4Positions,
      firstDate: DateTime(2016, 2, 26),
    ),
    Shift(
      id: 8,
      timetable: _timetableEight4,
      defaultName: 'Г',
      name: 'Г',
      description: '',
      positions: _eight4Positions,
      firstDate: DateTime(2016, 2, 24),
    ),
    Shift(
      id: 9,
      timetable: _timetableEight4,
      defaultName: 'Д',
      name: 'Д',
      description: '',
      positions: _eight4Positions,
      firstDate: DateTime(2016, 2, 22),
    ),
    Shift(
      id: 10,
      timetable: _timetableDay15,
      defaultName: '1 бригада',
      name: '1 бригада',
      description: '',
      positions: _day15Positions,
      firstDate: DateTime(2016, 2, 22),
    ),
    Shift(
      id: 11,
      timetable: _timetableDay15,
      defaultName: '2 бригада',
      name: '2 бригада',
      description: '',
      positions: _day15Positions,
      firstDate: DateTime(2016, 2, 20),
    ),
  ];

  static const _twelfth30Positions = const [
    const Position(
      id: 1,
      timetableId: 1,
      name: '1-я С УТРА',
      sign: '8',
      color: colorInDay,
      workHours: 12,
      normalHours: 8,
      description: 'В день',
      order: 1,
    ),
    const Position(
      id: 2,
      timetableId: 1,
      name: '2-я С УТРА',
      sign: '8',
      color: colorInDay,
      workHours: 12,
      normalHours: 8,
      description: 'В день',
      order: 2,
    ),
    const Position(
      id: 3,
      timetableId: 1,
      name: 'ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 8,
      description: 'Выходной',
      order: 3,
    ),
    const Position(
      id: 4,
      timetableId: 1,
      name: 'В НОЧЬ',
      sign: '20',
      color: colorInNight,
      workHours: 4,
      normalHours: 8,
      description: 'В ночь',
      order: 4,
    ),
    const Position(
      id: 5,
      timetableId: 1,
      name: 'С НОЧИ В НОЧЬ',
      sign: '20',
      color: colorInNight,
      workHours: 12,
      normalHours: 8,
      description: 'В ночь',
      order: 5,
    ),
    const Position(
      id: 6,
      timetableId: 1,
      name: 'ОТСЫПНОЙ',
      sign: 'О',
      color: colorAfterNight,
      workHours: 8,
      normalHours: 8,
      description: 'Отсыпной',
      order: 6,
    ),
    const Position(
      id: 7,
      timetableId: 1,
      name: 'ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 8,
      description: 'Выходной',
      order: 7,
    ),
    const Position(
      id: 8,
      timetableId: 1,
      name: 'ЗАВТРА С УТРА',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 8,
      description: 'Выходной',
      order: 8,
    ),
  ];

  static const _eight4Positions = const [
    const Position(
      id: 9,
      timetableId: 2,
      name: '1-я НОЧЬ',
      sign: '24',
      color: colorInNight,
      workHours: 0.5,
      normalHours: 7,
      description: 'В ночь',
      order: 1,
    ),
    const Position(
      id: 10,
      timetableId: 2,
      name: '2-я НОЧЬ',
      sign: '24',
      color: colorInNight,
      workHours: 8.5,
      normalHours: 7,
      description: 'В ночь',
      order: 2,
    ),
    const Position(
      id: 11,
      timetableId: 2,
      name: 'ОТСЫПНОЙ',
      sign: 'О',
      color: colorAfterNight,
      workHours: 8,
      normalHours: 7,
      description: 'Отсыпной',
      order: 3,
    ),
    const Position(
      id: 12,
      timetableId: 2,
      name: 'ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 7,
      description: 'Выходной',
      order: 4,
    ),
    const Position(
      id: 13,
      timetableId: 2,
      name: 'ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 7,
      description: 'Выходной',
      order: 5,
    ),
    const Position(
      id: 14,
      timetableId: 2,
      name: '1-я С 4-х',
      sign: '16',
      color: colorInEvening,
      workHours: 7.5,
      normalHours: 7,
      description: 'Вечерняя',
      order: 6,
    ),
    const Position(
      id: 15,
      timetableId: 2,
      name: '2-я С 4-х',
      sign: '16',
      color: colorInEvening,
      workHours: 7.5,
      normalHours: 7,
      description: 'Вечерняя',
      order: 7,
    ),
    const Position(
      id: 16,
      timetableId: 2,
      name: 'ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 7,
      description: 'Выходной',
      order: 8,
    ),
    const Position(
      id: 17,
      timetableId: 2,
      name: '1-я С УТРА',
      sign: '8',
      color: colorInDay,
      workHours: 8,
      normalHours: 7,
      description: 'С утра',
      order: 9,
    ),
    const Position(
      id: 18,
      timetableId: 2,
      name: '2-я С УТРА',
      sign: '8',
      color: colorInDay,
      workHours: 8,
      normalHours: 7,
      description: 'С утра',
      order: 10,
    ),
  ];

  static const _day15Positions = const [
    const Position(
      id: 19,
      timetableId: 3,
      name: '2-й ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 8,
      description: 'Выходной',
      order: 1,
    ),
    const Position(
      id: 20,
      timetableId: 3,
      name: '1-й ДЕНЬ',
      sign: '8',
      color: colorInDay,
      workHours: 11.25,
      normalHours: 8,
      description: 'Рабочий',
      order: 2,
    ),
    const Position(
      id: 21,
      timetableId: 3,
      name: '2-й ДЕНЬ',
      sign: '8',
      color: colorInDay,
      workHours: 11.25,
      normalHours: 8,
      description: 'Рабочий',
      order: 3,
    ),
    const Position(
      id: 22,
      timetableId: 4,
      name: '1-й ВЫХОДНОЙ',
      sign: '*',
      color: colorDayOff,
      workHours: 0,
      normalHours: 8,
      description: 'Выходной',
      order: 4,
    ),
  ];
}
