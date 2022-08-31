import 'package:flutter/material.dart';
import 'dart:async';

class DecisionTimer extends StatefulWidget {
  const DecisionTimer(
      {Key? key,
      required this.context,
      required this.nextScreen,
      required this.maxSeconds})
      : super(key: key);
  final BuildContext context;
  final Widget nextScreen;
  final int maxSeconds;

  @override
  // ignore: no_logic_in_create_state
  _TimerState createState() =>
      // ignore: no_logic_in_create_state
      _TimerState(
          context: context, nextScreen: nextScreen, maxSeconds: maxSeconds);
}

class _TimerState extends State<DecisionTimer> {
  _TimerState(
      {required this.context,
      required this.nextScreen,
      required this.maxSeconds})
      : super();

  int maxSeconds;
  late Timer timer;
  bool started = false;
  Widget nextScreen;
  @override
  final BuildContext context;

  void startTimer() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_timer) {
      if (maxSeconds == 0) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => nextScreen,
            ));
      } else if (mounted) {
        setState(() {
          maxSeconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!started) {
      startTimer();
    }
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          '$maxSeconds',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ));
  }
}
