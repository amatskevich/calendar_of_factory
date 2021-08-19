import 'package:calendaroffactory/main_screen/multi_view/multi_row_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiViewWidget extends StatelessWidget {
  final List<Shift> shifts;

  const MultiViewWidget(this.shifts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedDate = Provider.of<SelectedDate>(context, listen: true).selectedDate;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (ctx, index) {
        return MultiRowWidget(shifts[index], selectedDate);
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: shifts.length,
    );
  }
}
