import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({Key? key, required this.name, required this.callback})
      : super(key: key);

  final String name;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 300,
        height: 40,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.green[500]),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: callback, child: const Icon(Icons.delete)))
        ]));
  }
}
