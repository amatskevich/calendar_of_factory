import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'day_widget.dart';
import 'info_widget.dart';

class SingleViewWidget extends StatelessWidget {
  const SingleViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Info(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: const Divider(
            height: 5,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
        ListView.builder(
          itemBuilder: (ctx, index) {
            return Consumer<SelectedDate>(builder: (context, cart, child) {
              return DayItem(index: index, selectedDate: cart.selectedDate);
            });
          },
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 4,
        ),
      ],
    );
  }
}
