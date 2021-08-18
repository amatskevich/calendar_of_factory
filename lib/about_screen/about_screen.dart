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
            Text('Приложение для просмотра', style: TextStyle(fontSize: 20)),
            Text('графика работы смен', style: TextStyle(fontSize: 20)),
            Text('завода Полимир', style: TextStyle(fontSize: 20)),
            Text('Версия - 2.0.0-beta', style: TextStyle(fontSize: 20)), //TODO dynamic version
            Text('Разработчик ...', style: TextStyle(fontSize: 20)),
            Text('calendar.of.factory@gmail.com', style: TextStyle(fontSize: 20)), //TODO link mailto
          ],
        ),
      ),
    );
  }
}
