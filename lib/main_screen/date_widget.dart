import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'date_arrow_button.dart';

class DateInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
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
                return FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    DateFormat('yMMMEd', 'ru_RU').format(cart.selectedDate),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                );
              }),
              onPressed: () async {
                var datePicked = await DatePicker.showSimpleDatePicker(
                  context,
                  initialDate: Provider.of<SelectedDate>(context, listen: false).selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                  dateFormat: 'dd-MMMM-yyyy',
                  locale: DateTimePickerLocale.ru,
                  looping: true,
                  pickerMode: DateTimePickerMode.date,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  cancelText: 'Отмена',
                  confirmText: 'Ок',
                  titleText: 'Выбор даты'
                );
                if (datePicked != null) {
                  Provider.of<SelectedDate>(context, listen: false).selectedDate = datePicked;
                }
              },
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
