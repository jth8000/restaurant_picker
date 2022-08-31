import 'package:flutter/material.dart';

class ParticipantAtStart extends StatelessWidget {
  ParticipantAtStart(
      {Key? key, required this.participantName, required this.ready});

  final String participantName;
  final bool ready;

  @override
  Widget build(BuildContext context) {
    String statusString;

    if (ready) {
      statusString = 'Ready!';
    } else {
      statusString = 'Not Ready';
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(participantName, style: const TextStyle(fontSize: 18)),
      Text(statusString,
          style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.green[500]))
    ]);
  }
}
