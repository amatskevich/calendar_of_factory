import 'package:calendaroffactory/main_screen/multi_view/multi_row_widget.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiViewWidget extends StatelessWidget {
  const MultiViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(builder: (context, cart, child) {
      final data = cart.data;
      var selectedDate = Provider.of<SelectedDate>(context, listen: true).selectedDate;
      return Column(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (ctx, index) {
              return MultiRowWidget(data[index], selectedDate);
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
          ),
        ]
        ,
      );
    });
  }
}
