import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/calendar_screen/calendar_info_widget.dart';
import 'package:calendaroffactory/calendar_screen/month_grid_widget.dart';
import 'package:calendaroffactory/providers/salary_days_provider.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'week_day_names_widget.dart';

class CalendarScreen extends StatelessWidget {

  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as TimetableShift;
    var date = Provider.of<SelectedDate>(context, listen: true).selectedDate;
    var positions = CalendarEngine.calculatePositionsForMonth(day: date, shift: data.shift);
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          CalendarInfo(date, data.shift.name),
          WeekDayNames(),
          MonthGrid(positions, _calculateTodayDay(date), SalaryDaysProvider.getSalaryDays(date)),
        ],
      ),
    );
  }

  int _calculateTodayDay(DateTime date) {
    var today = DateTime.now();
    return today.year == date.year && today.month == date.month ? today.day : -1;
  }
}
