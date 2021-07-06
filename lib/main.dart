import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/configuration_screen.dart';
import 'screens/single_main_screen.dart';

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
        primarySwatch: Colors.blue,
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
