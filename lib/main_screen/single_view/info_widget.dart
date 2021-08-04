import 'package:calendaroffactory/configuration_main_screen/configuration_main_screen.dart';
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'Смена ${cart.getShiftName() != null ? cart.getShiftName() : ''}',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: cart.shift != null
                  ? () => Navigator.of(context).pushNamed(ConfigurationMainScreen.routeName, arguments: true)
                  : null,
              icon: Icon(Icons.edit),
            ),
          ],
        );
      }),
    );
  }
}
