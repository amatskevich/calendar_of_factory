import 'package:calendaroffactory/providers/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({Key? key}) : super(key: key);

  @override
  _ThemeDropdownState createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  String _selectedItem = UserSettings.themes[0];

  void _onChange(String? selectedItem) {
    setState(() {
      _selectedItem = selectedItem ?? _selectedItem;
    });
    Provider.of<UserSettings>(context, listen: false).saveTheme(_selectedItem);
  }

  void _loadTheme() async {
    var theme = await Provider.of<UserSettings>(context, listen: false).retrieveTheme();
    setState(() {
      _selectedItem = theme;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    // _selectedItem = await Provider.of<UserSettings>(context, listen: false).retrieveTheme();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Тема оформления',
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          border: const OutlineInputBorder(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
            icon: Icon(Icons.keyboard_arrow_down),
            value: _selectedItem,
            items: UserSettings.themes.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                ),
              );
            }).toList(),
            onChanged: _onChange,
          ),
        ),
      ),
    );
  }
}
