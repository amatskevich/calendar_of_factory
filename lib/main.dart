import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/configuration_screen.dart';
import 'single_main_screen/single_main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/': (context) => SingleMainScreen(),
        CalendarScreen.routeName: (_) => CalendarScreen(),
        ConfigurationScreen.routeName: (_) => ConfigurationScreen(),
        AboutScreen.routeName: (_) => AboutScreen(),
      },
    );
  }
}
