import 'package:flutter/material.dart';

class ConfigurationMainScreen extends StatelessWidget {

  static const routeName = '/configuration/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройка главного экрана'),
      ),
      body: ListView(),
    );
  }
}
