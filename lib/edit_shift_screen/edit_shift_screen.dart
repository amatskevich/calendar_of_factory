import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/timetables.dart';
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
  var _showOnMainScreen = false;

  var _isInit = true;

  Shift? _shift;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _shift = ModalRoute.of(context)!.settings.arguments as Shift;
      _showOnMainScreen = _shift!.showOnMainScreen;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState?.save();
    _shift!.name = _name;
    _shift!.description = _description;
    _shift!.showOnMainScreen = _showOnMainScreen;
    Provider.of<Timetables>(context, listen: false).updateShift(_shift!);
    Navigator.pop(context);
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
            DataRowWidget(value: _shift!.timetable.name),
            Form(
              key: _form,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Отображать на главной'),
                    value: _showOnMainScreen,
                    onChanged: (value) {
                      setState(() {
                        _showOnMainScreen = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Название смены',
                      hintText: _shift!.defaultName,
                    ),
                    initialValue: _shift!.name,
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_descriptionFocusNode);
                    },
                    onSaved: (value) {
                      _name = value != null && value.isNotEmpty ? value : _shift!.defaultName;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Дополнительная информация',
                    ),
                    maxLines: 5,
                    maxLength: 300,
                    initialValue: _shift!.description,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descriptionFocusNode,
                    onSaved: (value) {
                      _description = value != null ? value : '';
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
