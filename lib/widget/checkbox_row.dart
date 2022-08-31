import 'package:flutter/material.dart';

class CheckboxRow extends StatefulWidget {
  CheckboxRow({Key? key, required this.rowText, required this.callback})
      : super(key: key);
  final String rowText;
  VoidCallback callback;
  @override
  _CheckboxRowState createState() =>
      _CheckboxRowState(rowText: rowText, callback: callback);
}

class _CheckboxRowState extends State<CheckboxRow> {
  _CheckboxRowState({required this.rowText, required this.callback});
  VoidCallback callback;
  bool? value = false;
  final String rowText;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(rowText, style: const TextStyle(fontSize: 18)),
      Checkbox(
          value: true,
          onChanged: (bool? newValue) {
            callback();
          }),
    ]);
  }
}
