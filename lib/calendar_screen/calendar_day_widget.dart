import 'package:calendaroffactory/calendar_screen/position_dialog.dart';
import 'package:calendaroffactory/models/position.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final Position? position;
  final int dayNumber;
  final int todayDay;
  final List<int> salaryDays;

  const CalendarDay({
    required this.position,
    required this.dayNumber,
    required this.todayDay,
    required this.salaryDays,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: position == null ? null : () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return PositionDialog(
                day: dayNumber,
                position: position!,
                salary: salaryDays.contains(dayNumber),
              );
            });
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: position != null ? position!.color : Colors.black,
        shape: const ContinuousRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: position != null ? _buildCell(position!) : null,
      ),
    );
  }

  Widget _buildCell(Position pos) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 5),
          color: todayDay == dayNumber ? Colors.yellowAccent : null,
          child: Text(
            dayNumber.toString(),
            style: const TextStyle(
              fontSize: 15,
              color: const Color(0xFFC60204),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: Visibility(
                visible: salaryDays.contains(dayNumber),
                child: const Text(
                  '\$',
                  style: const TextStyle(
                    fontSize: 20,
                    color: const Color(0xFF025106),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                pos.sign,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
