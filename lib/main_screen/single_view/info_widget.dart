import 'package:calendaroffactory/calendar_screen/calendar_screen.dart';
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
        return Visibility(
          visible: cart.data.isNotEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: cart.data.first),
                  child: Text(
                    'Смена ${cart.data.first.shift.name}',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(ConfigurationMainScreen.routeName, arguments: true),
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        );
      }),
    );
  }
}
