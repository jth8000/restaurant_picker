import 'dart:ui';

import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget {
  const StandardTextField(
      {Key? key, required this.textController, required this.text})
      : super(key: key);
  final TextEditingController textController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
        selectionHeightStyle: BoxHeightStyle.strut,
        selectionWidthStyle: BoxWidthStyle.tight,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: text),
        controller: textController);
  }
}
