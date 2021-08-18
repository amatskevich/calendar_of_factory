import 'package:calendaroffactory/configuration_screen/shift_row_widget.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShiftsView extends StatefulWidget {
  const ShiftsView({Key? key}) : super(key: key);

  @override
  _ShiftsViewState createState() => _ShiftsViewState();
}

class _ShiftsViewState extends State<ShiftsView> {
  List<bool> _isOpen = [];
  List<Timetable> _timetables = [];

  @override
  void initState() {
    super.initState();
    _timetables = Provider.of<Timetables>(context, listen: false).timetables;
    _isOpen = List<bool>.generate(_timetables.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(8),
      dividerColor: Colors.red,
      children: _timetables.map((e) => _buildExpansionPanel(e, _timetables.indexOf(e))).toList(),
      expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
    );
  }

  ExpansionPanel _buildExpansionPanel(Timetable timetable, int index) {
    var shifts = Provider.of<Timetables>(context, listen: true).getShiftsByTimetableType(timetable.type);
    return ExpansionPanel(
      headerBuilder: (ctx, isOpen) {
        return Center(
          child: Text(
            timetable.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25),
          ),
        );
      },
      body: Column(
        children: shifts.map((shift) => ShiftRow(shift)).toList(),
      ),
      isExpanded: _isOpen[index],
      canTapOnHeader: true,
    );
  }
}
