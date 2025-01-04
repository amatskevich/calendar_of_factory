import 'dart:collection';

import 'package:calendaroffactory/add_shifts_screen/add_shifts_screen.dart';
import 'package:calendaroffactory/main_screen/date_widget.dart';
import 'package:calendaroffactory/main_screen/multi_view/multi_view_widget.dart';
import 'package:calendaroffactory/main_screen/single_view/single_view_widget.dart';
import 'package:calendaroffactory/main_screen/theme_image_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'slogan_widget.dart';
import 'welcome_dialog.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _key = 'by.matskevich.calendaroffactory.welcome';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru_RU', null);
    _initWelcomeDialog();
  }

  void _initWelcomeDialog() {
    SharedPreferences.getInstance().then((prefs) {
      var isFirstTime = prefs.getBool(_key);
      if (isFirstTime == null) {
        prefs.setBool(_key, false);
        showGeneralDialog(
            context: context,
            barrierColor: Colors.black,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return const WelcomeDialog();
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var shifts = Provider.of<Timetables>(context, listen: true).getGroupedShifts(mainScreen: true);
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(child: const Text('Смены Полимира', overflow: TextOverflow.fade)),
        actions: [const ThemeImage()],
      ),
      drawer: const MainDrawer(),
      // backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Slogan(),
          DateInfo(),
          const Divider(
            height: 5,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          _generateMainInformation(shifts),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 0,
        onPressed: () => Navigator.of(context).pushNamed(AddShiftsScreen.routeName),
      ),
    );
  }

  Widget _generateMainInformation(LinkedHashMap<Timetable, List<Shift>> shifts) {
    final length = shifts.length;
    Widget result;
    if (length == 0) {
      result = const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
        child: const Center(
          child: const Text(
            'Пожалуйста, добавьте хотя бы одну смену',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      );
    } else if (length == 1 && shifts.values.first.length == 1) {
      result = SingleViewWidget(shifts.values.first[0]);
    } else {
      result = MultiViewWidget(shifts);
    }
    return result;
  }
}
