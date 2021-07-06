import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {

  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      drawer: MainDrawer(),
      body: ListView(),
    );
  }
}
