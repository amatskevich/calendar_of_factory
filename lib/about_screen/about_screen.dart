import 'package:calendaroffactory/about_screen/app_version_widget.dart';
import 'package:calendaroffactory/about_screen/mailto_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справка'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Приложение для просмотра', style: const TextStyle(fontSize: 20)),
            const Text('графика работы смен', style: const TextStyle(fontSize: 20)),
            const Text('завода Полимир', style: const TextStyle(fontSize: 20)),
            AppVersion(),
            const Text('Разработчик ...', style: const TextStyle(fontSize: 20)),
            MailtoDeveloper(),
          ],
        ),
      ),
    );
  }
}
