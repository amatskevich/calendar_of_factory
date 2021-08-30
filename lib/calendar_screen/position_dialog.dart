import 'package:calendaroffactory/models/position.dart';
import 'package:flutter/material.dart';

class PositionDialog extends StatelessWidget {
  final int day;
  final Position position;
  final bool salary;

  const PositionDialog({required this.day, required this.position, required this.salary, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: position.color,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'День $day',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            position.description,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: salary,
            child: const Text(
              'зарплата/аванс',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
