import 'package:calendaroffactory/single_main_screen/date_widget.dart';
import 'package:calendaroffactory/single_main_screen/info_widget.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'day_widget.dart';

class SingleMainScreen extends StatefulWidget {
  @override
  _SingleMainScreenState createState() => _SingleMainScreenState();
}

class _SingleMainScreenState extends State<SingleMainScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Смены Полимира'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Info('Смена А'),
          DateInfo(),
          ListView.builder(
            itemBuilder: (ctx, index) {
              return DayItem(date: DateTime.now());
              // return Text('WTF');
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
