import 'package:calendaroffactory/add_shifts_screen/checkbox_list_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:calendaroffactory/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AddShiftsScreen extends StatefulWidget {
  static const routeName = '/configuration/main';

  @override
  _AddShiftsScreenState createState() => _AddShiftsScreenState();
}

class _AddShiftsScreenState extends State<AddShiftsScreen> {
  Timetable? _selectedTimesheet;
  final _selectedShifts = Set<int>();
  List<Timetable> _timetables = [];
  List<Shift> _shifts = [];

  void _selectTimesheet(Timetable selectedTimesheet) {
    setState(() {
      _selectedShifts.clear();
      _selectedTimesheet = selectedTimesheet;
      _shifts = Provider.of<Timetables>(context, listen: false).getShiftsByTimetableType(selectedTimesheet.type)
          .where((element) => !element.showOnMainScreen).toList();
    });
  }

  void _save() {
    Provider.of<Timetables>(context, listen: false).showShiftsOnMainScreen(_selectedShifts);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _timetables = Provider.of<Timetables>(context, listen: false).timetables;
  }

  void _selectShifts(bool isAdd, List<int> shiftIds) {
    setState(() {
      if (isAdd) {
        _selectedShifts.addAll(shiftIds);
      } else {
        _selectedShifts.removeAll(shiftIds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(child: const Text('Добавление смены')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            CustomDropdown<Timetable>(
              label: 'График',
              items: _timetables,
              nameFunc: (Timetable t) => '${t.name} (${t.timetableNumber})',
              func: _selectTimesheet,
            ),
            Visibility(
              child: CheckboxList(_shifts, _selectShifts, _selectedShifts),
              visible: _shifts.isNotEmpty,
            ),
            Visibility(
              child: const Text(
                'Все смены этого графика уже добавлены',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              visible: _selectedTimesheet != null && _shifts.isEmpty,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Отмена',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _selectedTimesheet != null && _selectedShifts.isNotEmpty ? () => _save() : null,
                    child: const Text(
                      'Сохранить',
                      style: const TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_selectedShifts.isNotEmpty ? Colors.lightGreen : Colors.lightGreen.shade200),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
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
