import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/calendar_screen/calendar_screen.dart';
import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/models/shift.dart';

import 'package:flutter/material.dart';

class MultiRowWidget extends StatelessWidget {
  final Shift shift;
  final DateTime selectedDate;

  const MultiRowWidget(this.shift, this.selectedDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var position = CalendarEngine.calculatePositionForDay(day: selectedDate, shift: shift);
    return Container(
      decoration: BoxDecoration(
        color: position.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black),
        ],
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: shift),
              child: Column(
                children: [
                  Text(
                    '${shift.timetable.name} - Смена: ${shift.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    position.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: shift),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
