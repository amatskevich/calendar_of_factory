import 'package:calendaroffactory/calendar_screen/calendar_body_widget.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final _data = ModalRoute.of(context)!.settings.arguments as TimetableShift;
    var selectedDate = Provider.of<SelectedDate>(context, listen: false).selectedDate;
    final _date = DateTime(selectedDate.year, selectedDate.month, 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Календарь'),
      ),
      drawer: const MainDrawer(),
      body: CalendarBody(_data, _date),
    );
  }
}
