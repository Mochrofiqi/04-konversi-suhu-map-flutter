import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listItem,
      required this.newValuee,
      required this.onDropdownChange})
      : super(key: key);

  final List<String> listItem;
  final String newValuee;
  final Function(dynamic) onDropdownChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: newValuee,
      onChanged: onDropdownChange
    );
  }
}
