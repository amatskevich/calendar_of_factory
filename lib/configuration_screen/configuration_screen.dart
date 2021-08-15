import 'package:calendaroffactory/configuration_screen/shifts_view_widget.dart';
import 'package:calendaroffactory/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  static const routeName = '/configuration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomDropdown<String>(
              label: 'Тема оформления',
              items: ['Пахне чабор', 'Василки', 'Жыве'],
              nameFunc: (String s) => s,
              func: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: const Divider(
                height: 5,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ),
            ShiftsView(),
          ],
        ),
      ),
    );
  }
}
