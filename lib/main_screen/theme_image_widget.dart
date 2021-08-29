import 'package:calendaroffactory/providers/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeImage extends StatelessWidget {
  const ThemeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentThemeName = Provider.of<UserSettings>(context, listen: true).currentThemeName;
    switch (currentThemeName) {
      case UserSettings.longLife:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/bchb.png",
          ),
        );
      case UserSettings.smellChabor:
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            "assets/chabor.png",
          ),
        );
      case UserSettings.vasilky:
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            "assets/vasilek.png",
          ),
        );
      default:
        return Container();
    }
  }
}
