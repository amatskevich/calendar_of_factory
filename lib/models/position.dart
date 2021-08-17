import 'package:flutter/material.dart';

class Position {
  final int id;
  final int timetableId;
  final String name;
  final String sign;
  final Color color;
  final double workHours;
  final double normalHours;
  final String description;
  final int order;

  const Position({
    required this.id,
    required this.timetableId,
    required this.name,
    required this.sign,
    required this.color,
    required this.workHours,
    required this.normalHours,
    required this.description,
    required this.order,
  });
}
