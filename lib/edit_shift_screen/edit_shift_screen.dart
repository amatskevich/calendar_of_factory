import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_row_widget.dart';

class EditShiftScreen extends StatelessWidget {
  static const routeName = '/edit_shift';

  const EditShiftScreen({Key? key}) : super(key: key);

  void _removeFromList(BuildContext context, TimetableShift data) {
    Provider.of<UserInfo>(context, listen: false).removeTimetableShift(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as TimetableShift;
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о смене'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: ListView(
            children: [
              DataRowWidget(value: data.timetableName),
              DataRowWidget(value: data.shift.name),
              DataRowWidget(value: data.shift.description),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => _removeFromList(context, data),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        'Удалить из списка',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () => Navigator.pop(context),
                    //     child: Text('Вернуться', style: TextStyle(fontSize: 20))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
