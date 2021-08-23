import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  final int index;
  final DateTime selectedDate;
  final Shift shift;

  const DayItem({Key? key, required this.index, required this.selectedDate, required this.shift}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = selectedDate.add(Duration(days: index));
    Position position = CalendarEngine.calculatePositionForDay(day: date, shift: shift);
    return Container(
      decoration: BoxDecoration(
        color: position.color,//.withOpacity(0.7),
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
              position.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              DateFormat('E, d MMMM', 'ru_RU').format(date),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
