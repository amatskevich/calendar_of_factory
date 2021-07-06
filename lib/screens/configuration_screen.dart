import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {

  static const routeName = '/configuration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: ListView(),
    );
  }
}
