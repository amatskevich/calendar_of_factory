import 'package:flutter/material.dart';

class DateArrowButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback func;
  const DateArrowButton(this.iconData, this.func);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 40,
          color: Colors.white,
          onPressed: func,
        ),
      ),
    );
  }
}
