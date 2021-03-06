import 'dart:collection';

import 'package:calendaroffactory/widgets/carousel_indicator_widget.dart';
import 'package:calendaroffactory/main_screen/multi_view/multi_row_widget.dart';
import 'package:calendaroffactory/models/shift.dart';
import 'package:calendaroffactory/models/timetable.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:calendaroffactory/providers/user_settings.dart';
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
  void initState() {
    super.initState();
    var timetableType = Provider.of<UserSettings>(context, listen: false).currentTimetableCarousel;
    var indexWhere = widget.timetables.keys.toList().indexWhere((element) => element.type.toString() == timetableType);
    _current = indexWhere > 0 ? indexWhere : 0;
  }

  void _changeTab(int index, CarouselPageChangedReason reason) {
    var timetableKey = widget.timetables.keys.toList()[index].type.toString();
    Provider.of<UserSettings>(context, listen: false).changeTimetableCarousel(timetableKey);
    setState(() {
      _current = index;
    });
  }

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
            initialPage: _current,
            viewportFraction: 0.95,
            aspectRatio: 3 / 4,
            onPageChanged: _changeTab,
          ),
        ),
      ],
    );
  }
}
