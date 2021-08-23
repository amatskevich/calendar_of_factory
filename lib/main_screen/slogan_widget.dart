import 'package:calendaroffactory/providers/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slogan extends StatelessWidget {
  const Slogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentThemeName = Provider.of<UserSettings>(context, listen: true).currentThemeName;
    switch (currentThemeName) {
      case UserSettings.longLife:
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'ЖЫВЕ БЕЛАРУСЬ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Epsilon',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        );
      case UserSettings.smellChabor:
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'ПАХНЕ ЧАБОР',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Epsilon',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        );
      case UserSettings.vasilky:
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'А хто там ідзе?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Bierahinia',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
