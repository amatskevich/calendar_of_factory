import 'package:calendaroffactory/providers/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({Key? key}) : super(key: key);

  @override
  _ThemeDropdownState createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  String _selectedItem = UserSettings.themes.keys.first;

  void _onChange(String? selectedItem) {
    setState(() {
      _selectedItem = selectedItem ?? _selectedItem;
    });
    Provider.of<UserSettings>(context, listen: false).changeTheme(_selectedItem);
  }

  void _loadTheme() {
    var themeName = Provider.of<UserSettings>(context, listen: false).currentThemeName;
    setState(() {
      _selectedItem = themeName;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Тема оформления',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
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
            items: UserSettings.themes.keys.map((item) {
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
