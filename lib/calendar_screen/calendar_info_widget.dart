import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarInfo extends StatelessWidget {
  final DateTime date;
  final String shiftName;

  const CalendarInfo(this.date, this.shiftName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('MMM yyyy', 'ru_RU').format(date),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            'Смена: ${shiftName}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
