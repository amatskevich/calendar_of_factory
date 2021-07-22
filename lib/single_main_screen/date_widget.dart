import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_arrow_button.dart';

class DateInfo extends StatefulWidget {
  const DateInfo({Key? key}) : super(key: key);

  @override
  _DateInfoState createState() => _DateInfoState();
}

class _DateInfoState extends State<DateInfo> {
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _nextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  void _beforeDay() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: -1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          DateArrowButton(Icons.keyboard_arrow_left, _beforeDay),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              child: Text(
                DateFormat('yMMMEd', 'ru_RU').format(_selectedDate),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              onPressed: _presentDatePicker,
            ),
          ),
          DateArrowButton(Icons.keyboard_arrow_right, _nextDay),
        ],
      ),
    );
  }
}
