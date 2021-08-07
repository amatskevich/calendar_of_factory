import 'package:calendaroffactory/configuration_main_screen/configuration_main_screen.dart';
import 'package:calendaroffactory/configuration_shifts_data/configuration_shifts_data_screen.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_shift_screen/edit_shift_screen.dart';
import 'providers/timetables.dart';
import 'screens/about_screen.dart';
import 'screens/calendar_screen.dart';
import 'main_screen/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SelectedDate()),
        ChangeNotifierProvider.value(value: UserInfo()),
        ChangeNotifierProvider.value(value: Timetables()),
      ],
      child: MaterialApp(
        title: 'Смены Полимира',
        initialRoute: '/',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          fontFamily: 'Georgia',

          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
//      home: SingleMainScreen(),
        routes: {
          '/': (context) => MainScreen(),
          CalendarScreen.routeName: (_) => CalendarScreen(),
          ConfigurationMainScreen.routeName: (_) => ConfigurationMainScreen(),
          ConfigurationShiftsDataScreen.routeName: (_) => ConfigurationShiftsDataScreen(),
          AboutScreen.routeName: (_) => AboutScreen(),
          EditShiftScreen.routeName: (_) => EditShiftScreen(),
        },
      ),
    );
  }
}
