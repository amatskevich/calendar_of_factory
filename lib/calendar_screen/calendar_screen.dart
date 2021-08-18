import 'package:calendaroffactory/calendar_screen/calendar_body_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final shift = ModalRoute.of(context)!.settings.arguments as Shift;
    var selectedDate = Provider.of<SelectedDate>(context, listen: false).selectedDate;
    final date = DateTime(selectedDate.year, selectedDate.month, 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Календарь'),
      ),
      body: CalendarBody(shift, date),
    );
  }
}
