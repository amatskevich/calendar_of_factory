import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final Function func;
  final String Function(T t) nameFunc;

  CustomDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.func,
    required this.nameFunc,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedItem;

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _selectedItem = null;
    }
  }

  void _onChange(T? selectedItem) {
    setState(() {
      _selectedItem = selectedItem as T;
    });
    widget.func(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
          // labelStyle: Theme.of(context).primaryTextTheme.caption.copyWith(color: Colors.black),
          border: const OutlineInputBorder(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            isExpanded: true,
            isDense: true,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            value: _selectedItem,
            items: widget.items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: FittedBox(
                  child: Text(
                    widget.nameFunc(item),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: widget.items.isNotEmpty ? _onChange : null,
          ),
        ),
      ),
    );
  }
}
