import 'package:calendaroffactory/calendar_engine.dart';
import 'package:calendaroffactory/calendar_screen/calendar_screen.dart';
import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
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
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: data),
              child: Column(
                children: [
                  Text(
                    '${data.timetableName} - Смена: ${data.shift.name}',
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
            onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: data),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
