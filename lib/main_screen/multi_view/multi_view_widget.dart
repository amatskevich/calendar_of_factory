import 'package:calendaroffactory/main_screen/multi_view/multi_row_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiViewWidget extends StatelessWidget {
  final Map<Timetable, List<Shift>> timetables;

  const MultiViewWidget(this.timetables, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedDate = Provider.of<SelectedDate>(context, listen: true).selectedDate;
    return CarouselSlider(
      items: timetables.entries.map((i) {
        var shifts = i.value;
        return Builder(
          builder: (BuildContext context) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemBuilder: (ctx, index) {
                  return MultiRowWidget(shifts[index], selectedDate);
                },
                shrinkWrap: true,
                itemCount: shifts.length,

            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: 0.95,
        aspectRatio: 3 / 4,
        pageViewKey: PageStorageKey<String>('by.matskevich.calendaroffactory.carousel'),
      ),
    );
  }
}
