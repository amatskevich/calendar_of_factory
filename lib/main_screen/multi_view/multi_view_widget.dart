import 'dart:collection';

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

  List<Widget> _generateIndicator() {
    List<Widget> res = [];
    var _index = 0;
    widget.timetables.forEach((key, value) {
      var gestureDetector = GestureDetector(
        onTap: () => _controller.animateToPage(_index),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: _current == _index ? Text(
            key.defaultName,
            style: TextStyle(color: Colors.black, fontSize: 23),
          ) : Text(
            key.defaultName,
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.black38, fontSize: 15),
          ),
        ),
      );
      res.add(gestureDetector);
      _index++;
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var selectedDate = Provider.of<SelectedDate>(context, listen: true).selectedDate;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _generateIndicator(),
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
          options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.95,
              aspectRatio: 3 / 4,
              pageViewKey: PageStorageKey<String>('by.matskevich.calendaroffactory.carousel'),
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
