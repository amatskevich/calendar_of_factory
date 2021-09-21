import 'package:calendaroffactory/models/shift.dart';
import 'package:flutter/material.dart';

class CheckboxList extends StatelessWidget {
  final List<Shift> shifts;
  final Set<int> selectedIds;
  final void Function(bool isAdd, List<int> shifts) selectShifts;

  const CheckboxList(this.shifts, this.selectShifts, this.selectedIds, {Key? key}) : super(key: key);

  bool? _calculateGeneralCheckbox() {
    if (selectedIds.length == shifts.length) {
      return true;
    } else if (selectedIds.isEmpty) {
      return false;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text(
            "Все смены",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          tristate: true,
          controlAffinity: ListTileControlAffinity.leading,
          value: _calculateGeneralCheckbox(),
          onChanged: (bool? value) {
            selectShifts(value ?? false, shifts.map((e) => e.id).toList());
          },
        ),
        ...shifts.map((e) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: CheckboxListTile(
              title: Text(
                e.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              activeColor: Theme.of(context).primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: selectedIds.contains(e.id),
              onChanged: (bool? value) {
                selectShifts(value ?? false, [e.id]);
              },
            ),
          );
        }).toList(),
      ],
    );
  }
}
