import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SingleMainScreen extends StatefulWidget {
  @override
  _SingleMainScreenState createState() => _SingleMainScreenState();
}

class _SingleMainScreenState extends State<SingleMainScreen> {
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Смены Полимира'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Text('Смена А'),
          Text('dfdf'),
          TextButton(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            child: Text(
              DateFormat('yMMMEd', 'ru_RU').format(_selectedDate),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: _presentDatePicker,
          ),
          ListView.builder(
            itemBuilder: (ctx, index) {
              return Text('data');
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
          )
        ],
      ),
    );
  }
}
