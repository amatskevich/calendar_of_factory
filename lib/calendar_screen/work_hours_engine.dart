import 'package:calendaroffactory/models/position.dart';

class WorkHoursEngine {
  static const years_holidays = {
    1: [1, 7],
    3: [8],
    4: [31],
    5: [1, 9],
    7: [3],
    11: [7],
    12: [25, 32],
  };

  static const special_holidays = {
    '5_2016': [10, 29],
    '4_2017': [25],
    '5_2017': [28],
    '4_2018': [17],
    '5_2018': [27],
    '5_2019': [7, 26],
    '1_2020': [2],
    '4_2020': [28],
    '5_2020': [31],
    '5_2021': [11, 30],
    '5_2022': [3, 29],
    '4_2023': [25],
    '5_2023': [28],
    '5_2024': [14, 26],
    '4_2025': [29],
    '5_2025': [25],
    '4_2026': [21],
    '5_2026': [31],
  };

  static List<int> _getHolidaysByMonthYear({required int month, required int year}) {
    List<int> result = [];
    if (years_holidays.containsKey(month)) {
      result.addAll(years_holidays[month]!);
    }
    var yearMonth = '${month}_$year';
    if (special_holidays.containsKey(yearMonth)) {
      result.addAll(special_holidays[yearMonth]!);
    }
    return result;
  }

  static WorkHoursData calculateWorkHoursData({
    required List<Position?> positions,
    required int month,
    required int year,
  }) {
    var fullHours = 0.0;
    var holidayHours = 0.0;
    var normalHours = 0.0;
    var holidays = _getHolidaysByMonthYear(month: month, year: year);
    var dayOfMonth = DateTime(year, month, 1);
    positions.where((element) => element != null).forEach((position) {
      var isHoliday = holidays.contains(dayOfMonth.day);
      fullHours += position!.workHours;
      if (isHoliday) {
        holidayHours += position.workHours;
      }
      if (!isHoliday && dayOfMonth.weekday != DateTime.saturday && dayOfMonth.weekday != DateTime.sunday) {
        normalHours += position.normalHours;
        if (holidays.contains(dayOfMonth.day + 1)) {
          normalHours -= 1;
        }
      }
      dayOfMonth = dayOfMonth.add(const Duration(days: 1));
    });
    return WorkHoursData(
      fullHours: _convertHoursToString(fullHours),
      overHours: _convertHoursToString(fullHours - normalHours),
      holidayHours: _convertHoursToString(holidayHours),
      normalHours: _convertHoursToString(normalHours),
    );
  }

  static String _convertHoursToString(double hours) {
    if (hours <= 0) {
      return "-";
    }

    var min = (hours * 60).toInt();
    int mm = min % 60;
    int hh = (min - mm) ~/ 60;
    return mm == 0 ? "$hhч" : "$hhч $mmмин";
  }
}

class WorkHoursData {
  final String fullHours;
  final String overHours;
  final String holidayHours;
  final String normalHours;

  const WorkHoursData({
    required this.fullHours,
    required this.overHours,
    required this.holidayHours,
    required this.normalHours,
  });
}
