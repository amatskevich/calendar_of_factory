import 'package:flutter/material.dart';

class ConfigurationShiftsDataScreen extends StatelessWidget {

  static const routeName = '/configuration/shifts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройка информации о сменах'),
      ),
      body: ListView(),
    );
  }
}
