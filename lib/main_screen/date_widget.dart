import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'date_arrow_button.dart';

class DateInfo extends StatelessWidget {
  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: Provider.of<SelectedDate>(context, listen: false).selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      Provider.of<SelectedDate>(context, listen: false).selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          DateArrowButton(
            Icons.keyboard_arrow_left,
            () => Provider.of<SelectedDate>(context, listen: false).beforeDay(),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              child: Consumer<SelectedDate>(builder: (context, cart, child) {
                return Text(
                  DateFormat('yMMMEd', 'ru_RU').format(cart.selectedDate),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                );
              }),
              onPressed: () => _presentDatePicker(context),
            ),
          ),
          DateArrowButton(
            Icons.keyboard_arrow_right,
            () => Provider.of<SelectedDate>(context, listen: false).nextDay(),
          ),
        ],
      ),
    );
  }
}
