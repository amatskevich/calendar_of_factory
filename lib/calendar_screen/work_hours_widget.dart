import 'package:calendaroffactory/calendar_screen/work_hours_engine.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:flutter/material.dart';

class WorkHours extends StatelessWidget {
  final String timetableNumber;
  final List<Position?> positions;
  final DateTime date;

  const WorkHours({
    required this.timetableNumber,
    required this.positions,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var workHoursData =
        WorkHoursEngine.calculateWorkHoursData(positions: positions, year: date.year, month: date.month);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              timetableNumber,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _generateRow('Фактические часы:', workHoursData.fullHours),
          _generateRow('Норма рабочего времени:', workHoursData.normalHours),
          _generateRow('Переработанные часы:', workHoursData.overHours),
          _generateRow('Праздничные часы:', workHoursData.holidayHours),
        ],
      ),
    );
  }

  Widget _generateRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 15),),
          Text(value, style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}
