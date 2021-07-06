import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Справка'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Приложение для просмотра'),
            Text('графика работы смен'),
            Text('завода Полимир'),
            Text('Версия - 2.0.0'), //TODO dynamic version
            Text('Разработчик Андрей Мацкевич'),
            Text('matskevichandrei@gmail.com'), //TODO link mailto
          ],
        ),
      ),
    );
  }
}
