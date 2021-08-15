import 'package:calendaroffactory/calendar_screen/calendar_screen.dart';
import 'package:calendaroffactory/edit_shift_screen/edit_shift_screen.dart';
import 'package:calendaroffactory/providers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(9.5),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(color: Colors.black),
        // ],
      ),
      child: Consumer<UserInfo>(builder: (context, cart, child) {
        return Visibility(
          visible: cart.data.isNotEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: cart.data.first),
                  child: Column(
                    children: [
                      Text(
                        cart.data.first.timetableName,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Смена ${cart.data.first.shift.name}',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(EditShiftScreen.routeName, arguments: cart.data.first),
                icon: Icon(Icons.info_outline),
                iconSize: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}
