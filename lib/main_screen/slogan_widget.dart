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
              color: Colors.red.shade300,
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
              color: Colors.purple.shade300,
            ),
          ),
        );
      case UserSettings.vasilky:
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'А хто там ідзе?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bierahinia',
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade400,
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
