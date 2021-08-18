import 'package:calendaroffactory/configuration_main_screen/configuration_main_screen.dart';
import 'package:calendaroffactory/main_screen/date_widget.dart';
import 'package:calendaroffactory/main_screen/multi_view/multi_view_widget.dart';
import 'package:calendaroffactory/main_screen/single_view/single_view_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    var shifts = Provider.of<Timetables>(context, listen: true).getShiftsForMainScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Смены Полимира+'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
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
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(ConfigurationMainScreen.routeName),
      ),
    );
  }

  Widget _generateMainInformation(List<Shift> shifts) {
    final length = shifts.length;
    Widget result;
    if (length == 0) {
      result = Center(
        child: const Text(
          'Пожалуйста добавьте хотя бы одну смену',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      );
    } else if (length == 1) {
      result = SingleViewWidget(shifts[0]);
    } else {
      result = MultiViewWidget(shifts);
    }
    return result;
  }
}
