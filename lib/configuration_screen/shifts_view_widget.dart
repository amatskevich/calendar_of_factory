import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (ctx, i) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Смена ${timetable.shifts[i].name}',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  EditShiftScreen.routeName,
                  arguments: TimetableShift(
                    timetableType: timetable.type,
                    timetableName: timetable.name,
                    timetableNumber: timetable.timetableNumber,
                    shift: timetable.shifts[i],
                  ),
                ),
                icon: Icon(Icons.info_outline),
                iconSize: 30,
              ),
            ],
          );
        },
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: timetable.shifts.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
      isExpanded: _isOpen[index],
      canTapOnHeader: true,
    );
  }
}
