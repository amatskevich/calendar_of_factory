import 'package:calendaroffactory/providers/user_info.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {

  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as TimetableShift;
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          Text(data.shift.name),
        ],
      ),
    );
  }
}
