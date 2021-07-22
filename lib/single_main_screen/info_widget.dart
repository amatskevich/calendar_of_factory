import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String shiftName;

  const Info(this.shiftName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(9.5),
      child: Text(
        shiftName,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }
}
