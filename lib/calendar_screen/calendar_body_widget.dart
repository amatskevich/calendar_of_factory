import 'package:calendaroffactory/providers/salary_days_provider.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';

import '../calendar_engine.dart';
import 'calendar_info_widget.dart';
import 'month_grid_widget.dart';
import 'week_day_names_widget.dart';
import 'work_hours_widget.dart';

class CalendarBody extends StatefulWidget {
  final TimetableShift data;
  final DateTime initialDate;

  const CalendarBody(this.data, this.initialDate, {Key? key}) : super(key: key);

  @override
  _CalendarBodyState createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _date = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    var positions = CalendarEngine.calculatePositionsForMonth(day: _date, shift: widget.data.shift);
    return ListView(
      children: [
        CalendarInfo(_date, widget.data.shift.name),
        const WeekDayNames(),
        GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: MonthGrid(
            positions,
            _calculateTodayDay(_date),
            SalaryDaysProvider.getSalaryDays(_date),
          ),
        ),
        WorkHours(
          timetableNumber: widget.data.timetableNumber,
          positions: positions,
          date: _date,
        ),
      ],
    );
  }

  void _onSwipe(DragEndDetails details) {
    var velocity = details.primaryVelocity != null ? details.primaryVelocity! : 0.0;
    var deltaMonth = 0;
    if (velocity == 0) {
      return;
    } else if (velocity < 0) {
      deltaMonth = 1;
    } else if (velocity > 0) {
      deltaMonth = -1;
    }
    setState(() {
      _date = DateTime(_date.year, _date.month + deltaMonth, 1);
    });
  }

  int _calculateTodayDay(DateTime date) {
    var today = DateTime.now();
    return today.year == date.year && today.month == date.month ? today.day : -1;
  }
}
