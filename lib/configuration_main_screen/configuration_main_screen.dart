import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:calendaroffactory/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationMainScreen extends StatefulWidget {
  static const routeName = '/configuration/main';

  @override
  _ConfigurationMainScreenState createState() => _ConfigurationMainScreenState();
}

class _ConfigurationMainScreenState extends State<ConfigurationMainScreen> {
  Timetable? _selectedTimesheet;
  Shift? _selectedShift;

  List<Timetable> _timetables = [];
  List<Shift> _shifts = [];

  void _selectTimesheet(Timetable selectedTimesheet) {
    setState(() {
      _selectedShift = null;
      _selectedTimesheet = selectedTimesheet;
      _shifts = Provider.of<Timetables>(context, listen: false).getShiftsByTimetableType(selectedTimesheet.type);
    });
  }

  void _selectShift(Shift selectedShift) {
    setState(() {
      _selectedShift = selectedShift;
    });
  }

  void _save() {
    Provider.of<Timetables>(context, listen: false).showShiftOnMainScreen(_selectedShift!.id);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _timetables = Provider.of<Timetables>(context, listen: false).timetables;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавление смены'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropdown<Timetable>(
              label: 'График',
              items: _timetables,
              nameFunc: (Timetable t) => '${t.name} (${t.timetableNumber})',
              func: _selectTimesheet,
            ),
            CustomDropdown<Shift>(
              label: 'Смена',
              items: _shifts,
              nameFunc: (Shift s) => s.name,
              func: _selectShift,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    'Отмена',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                    onPressed: _selectedTimesheet != null && _selectedShift != null ? () => _save() : null,
                    child: Text('Сохранить', style: TextStyle(fontSize: 20))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
