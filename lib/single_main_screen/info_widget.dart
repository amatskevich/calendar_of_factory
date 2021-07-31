import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(9.5),
      child: Consumer<UserInfo>(builder: (context, cart, child) {
        return Text(
          'Смена ${cart.getShiftName() != null ? cart.getShiftName() : ''}',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}
