import 'package:flutter/material.dart';

class WeekDayNames extends StatelessWidget {
  const WeekDayNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _generateText('Пн'),
        _generateText('Вт'),
        _generateText('Ср'),
        _generateText('Чт'),
        _generateText('Пт'),
        _generateText('Сб'),
        _generateText('Вс'),
      ],
    );
  }

  Widget _generateText(String text) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
          boxShadow: [
            const BoxShadow(color: Colors.black),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
