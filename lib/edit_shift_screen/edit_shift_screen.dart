import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_row_widget.dart';

class EditShiftScreen extends StatefulWidget {
  static const routeName = '/edit_shift';

  const EditShiftScreen({Key? key}) : super(key: key);

  @override
  _EditShiftScreenState createState() => _EditShiftScreenState();
}

class _EditShiftScreenState extends State<EditShiftScreen> {
  final _form = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();

  var _name = '';
  var _description = '';

  var _isInit = true;

  TimetableShift? _timetableShift;


  @override
  void didChangeDependencies() {
    if (_isInit) {
      _timetableShift = ModalRoute.of(context)!.settings.arguments as TimetableShift;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _removeFromList(BuildContext context, TimetableShift data) {
    Provider.of<UserInfo>(context, listen: false).removeTimetableShift(data);
    Navigator.pop(context);
  }

  void _saveForm() {
    _form.currentState?.save();
    print(_name);
    print(_description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о смене'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataRowWidget(value: _timetableShift!.timetableName),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Название смены',
                      hintText: _timetableShift!.shift.defaultName,
                    ),
                    initialValue: _timetableShift!.shift.name,
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_descriptionFocusNode);
                    },
                    onSaved: (value) {_name = value != null && value.isNotEmpty ? value : _timetableShift!.shift.defaultName;},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Дополнительная информация',
                    ),
                    maxLines: 5,
                    maxLength: 300,
                    initialValue: _timetableShift!.shift.description,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descriptionFocusNode,
                    onSaved: (value) {_description = value != null ? value : '';},
                  ),
                  // DataRowWidget(value: data.shift.name),
                  // DataRowWidget(value: data.shift.description),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _removeFromList(context, _timetableShift!),
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
    );
  }
}
