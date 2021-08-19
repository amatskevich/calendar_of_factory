import 'package:calendaroffactory/calendar_screen/calendar_day_widget.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:flutter/material.dart';

class MonthGrid extends StatelessWidget {
  final List<Position?> positions;
  final int todayDay;
  final List<int> salaryDays;

  const MonthGrid(this.positions, this.todayDay, this.salaryDays, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dayNumber = 1;
    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: positions.length,
          itemBuilder: (BuildContext context, int index) {
            return CalendarDay(
              position: positions[index],
              todayDay: todayDay,
              salaryDays: salaryDays,
              dayNumber: positions[index] != null ? dayNumber++ : -1,
            );
          }),
    );
  }
}
