import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayItem extends StatelessWidget {
  final int index;
  final DateTime selectedDate;

  const DayItem({Key? key, required this.index, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = selectedDate.add(Duration(days: index));
    var shift = Provider.of<UserInfo>(context, listen: false).shift!;
    Position position = CalendarEngine.calculatePositionForDay(day: date, shift: shift);
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