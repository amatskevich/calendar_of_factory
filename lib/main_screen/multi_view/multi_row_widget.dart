import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';

class MultiRowWidget extends StatelessWidget {
  final TimetableShift data;
  final DateTime selectedDate;

  const MultiRowWidget(this.data, this.selectedDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var position = CalendarEngine.calculatePositionForDay(day: selectedDate, shift: data.shift);
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
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              '${data.timetableName} - Смена: ${data.shift.name}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              position.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
