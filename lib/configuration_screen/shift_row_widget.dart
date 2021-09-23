import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/timetables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShiftRow extends StatelessWidget {
  final Shift shift;

  const ShiftRow(this.shift, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                shift.name,
                style: const TextStyle(fontSize: 25),
                overflow: TextOverflow.fade,
                softWrap: false,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (shift.showOnMainScreen) {
                Provider.of<Timetables>(context, listen: false).hideShiftOnMainScreen(shift.id);
              } else {
                Provider.of<Timetables>(context, listen: false).showShiftOnMainScreen(shift.id);
              }
            },
            icon: Icon(
              shift.showOnMainScreen ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
            ),
            iconSize: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: shift),
              icon: Icon(
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
              ),
              iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
