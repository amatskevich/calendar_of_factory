import 'package:calendaroffactory/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class MultiMainScreen extends StatelessWidget {

  static const routeName = '/multiMain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi_mode'),
      ),
      drawer: MainDrawer(),
      body: ListView(),
    );
  }
}
