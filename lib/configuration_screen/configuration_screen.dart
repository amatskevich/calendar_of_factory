import 'package:calendaroffactory/configuration_screen/theme_dropdown_widget.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shifts_carousel_widget.dart';

class ConfigurationScreen extends StatelessWidget {
  static const routeName = '/configuration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const ThemeDropdown(),
            const Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: const Divider(
                height: 5,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ),
            _generateShiftsCarousel(context),
          ],
        ),
      ),
    );
  }

  ShiftsCarousel _generateShiftsCarousel(BuildContext context) {
    var shifts = Provider.of<Timetables>(context, listen: true).getGroupedShifts();
    return ShiftsCarousel(shifts);
  }
}
