import 'package:flutter/material.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen(
      {Key? key, required this.title, required this.body, required this.home});

  final String title;
  final Widget body;
  final bool home;

  @override
  _ScreenState createState() =>
      // ignore: no_logic_in_create_state
      _ScreenState(title: title, home: home, body: body);
}

class _ScreenState extends State<StandardScreen> {
  _ScreenState({required this.title, required this.home, required this.body});
  final bool home;
  final String title;
  final Widget body;
  AppBar appBar = AppBar(title: const Text('Restaurant Picker'));

  @override
  Widget build(BuildContext context) {
    getAppBar(home, title, context);
    return Scaffold(appBar: appBar, body: body);
  }

  void getAppBar(bool home, String title, BuildContext context) {
    setState(() {
      if (home) {
        appBar = AppBar(title: Text(title));
      } else {
        appBar = AppBar(
            title: Text(title),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }));
      }
    });
  }
}
