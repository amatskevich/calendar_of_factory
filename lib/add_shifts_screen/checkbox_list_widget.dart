import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

class CheckboxList extends StatelessWidget {
  final List<Shift> shifts;
  final Set<int> selectedIds;
  final void Function(bool isAdd, List<int> shifts) selectShifts;

  const CheckboxList(this.shifts, this.selectShifts, this.selectedIds, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Все смены"),
          value: selectedIds.length == shifts.length,
          onChanged: (bool? value) {
            selectShifts(value ?? false, shifts.map((e) => e.id).toList());
          },
        ),
        ...shifts.map((e) {
          return CheckboxListTile(
            title: Text(e.name),
            activeColor: Theme.of(context).primaryColor,
            value: selectedIds.contains(e.id),
            onChanged: (bool? value) {
              selectShifts(value ?? false, [e.id]);
            },
          );
        }).toList(),
      ],
    );
  }
}
