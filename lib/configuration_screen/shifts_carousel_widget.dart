import 'dart:collection';

import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/widgets/carousel_indicator_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'shift_row_widget.dart';

class ShiftsCarousel extends StatefulWidget {
  final LinkedHashMap<Timetable, List<Shift>> timetables;

  const ShiftsCarousel(this.timetables, {Key? key}) : super(key: key);

  @override
  _ShiftsCarouselState createState() => _ShiftsCarouselState();
}

class _ShiftsCarouselState extends State<ShiftsCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
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
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (ctx, index) {
                    return ShiftRow(shifts[index]);
                  },
                  shrinkWrap: true,
                  itemCount: shifts.length,
                  separatorBuilder: (context, index) {
                    return Divider(thickness: 2, color: Theme.of(context).primaryColorLight,);
                  },
                );
              },
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 3 / 4,
            onPageChanged: _changeTab,
          ),
        ),
      ],
    );
  }

  void _changeTab(int index, CarouselPageChangedReason reason) {
    setState(() {
      _current = index;
    });
  }
}
