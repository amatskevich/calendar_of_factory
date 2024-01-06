import 'package:calendaroffactory/about_screen/about_screen.dart';
import 'package:calendaroffactory/configuration_screen/configuration_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

  Widget buildListTitle(String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
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
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
          ),
          buildListTitle(
            'Главная',
            Icons.home,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTitle(
            'Настройки',
            Icons.settings,
            () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(ConfigurationScreen.routeName);
            },
          ),
          buildListTitle(
            'Справка',
            Icons.info,
            () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
