import 'dart:collection';

import 'package:calendaroffactory/main_screen/multi_view/carousel_indicator_widget.dart';
import 'package:calendaroffactory/main_screen/multi_view/multi_row_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiViewWidget extends StatefulWidget {
  final LinkedHashMap<Timetable, List<Shift>> timetables;

  const MultiViewWidget(this.timetables, {Key? key}) : super(key: key);

  @override
  _MultiViewWidgetState createState() => _MultiViewWidgetState();
}

class _MultiViewWidgetState extends State<MultiViewWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var selectedDate = Provider.of<SelectedDate>(context, listen: true).selectedDate;
    return Column(
      children: [
        CarouselIndicator(
          _current,
          _controller,
          widget.timetables.keys.toList(),
        ),
        CarouselSlider(
          items: widget.timetables.entries.map((i) {
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
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 0.95,
              aspectRatio: 3 / 4,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ],
    );
  }
}
