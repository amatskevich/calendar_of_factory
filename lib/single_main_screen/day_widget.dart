import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  final int index;
  final DateTime selectedDate;

  const DayItem({Key? key, required this.index, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = selectedDate.add(Duration(days: index));
    return Container(
      decoration: BoxDecoration(color: Colors.cyanAccent),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'С НОЧИ В НОЧЬ',
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
