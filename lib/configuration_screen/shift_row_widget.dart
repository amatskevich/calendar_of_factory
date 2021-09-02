import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

class ShiftRow extends StatelessWidget {
  final Shift shift;

  const ShiftRow(this.shift, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: const Border(
          top: const BorderSide(
            width: 0.8,
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Смена ${shift.name}',
                style: const TextStyle(fontSize: 25),
                overflow: TextOverflow.fade,
                softWrap: false,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: shift),
            icon: const Icon(Icons.info_outline),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
