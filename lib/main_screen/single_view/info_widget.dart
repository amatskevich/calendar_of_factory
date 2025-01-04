import 'package:calendaroffactory/calendar_screen/calendar_screen.dart';
import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final Shift shift;

  const Info(this.shift);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: shift),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(9.5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Icon(
                Icons.calendar_today,
                size: 25,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    shift.timetable.name,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Смена ${shift.name}',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: shift),
              icon: const Icon(Icons.info_outline),
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
