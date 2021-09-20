
import 'package:calendaroffactory/models/timetable.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int current;
  final CarouselController controller;
  final List<Timetable> timetables;

  const CarouselIndicator(this.current, this.controller, this.timetables, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateIndicator(),
    );
  }

  List<Widget> _generateIndicator() {
    return timetables
        .asMap()
        .entries
        .map((entry) => GestureDetector(
              onTap: () => controller.jumpToPage(entry.key),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: current == entry.key
                    ? Text(
                        entry.value.defaultName,
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      )
                    : Text(
                        entry.value.defaultName,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      ),
              ),
            ))
        .toList();
  }
}
