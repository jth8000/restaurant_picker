import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  const StandardButton(
      {Key? key, required this.buttonText, required this.callback})
      : super(key: key);

  final String buttonText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20.0),
        child: TextButton(
            onPressed: callback,
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 16),
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: const Size(175.0, 50.0))));
  }
}
