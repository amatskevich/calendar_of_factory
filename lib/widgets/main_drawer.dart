import 'package:calendaroffactory/configuration_main_screen/configuration_main_screen.dart';
import 'package:calendaroffactory/configuration_shifts_data/configuration_shifts_data_screen.dart';
import 'package:calendaroffactory/screens/about_screen.dart';
import 'package:calendaroffactory/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          buildListTitle(
            'Главная',
            Icons.home,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTitle(
            'Календарь',
            Icons.calendar_today,
            () => Navigator.of(context).pushReplacementNamed(CalendarScreen.routeName),
          ),
          ExpansionTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Настройки',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Главного экрана',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(ConfigurationMainScreen.routeName),
              ),
              ListTile(
                title: Text(
                  'Информации о сменах',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(ConfigurationShiftsDataScreen.routeName),
              ),
            ],
          ),
          buildListTitle(
            'Справка',
            Icons.info,
            () => Navigator.of(context).pushNamed(AboutScreen.routeName),
          ),
        ],
      ),
    );
  }
}
