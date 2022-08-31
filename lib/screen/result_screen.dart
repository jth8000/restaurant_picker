import 'package:flutter/material.dart';
import 'package:restaurant_picker/singleton/singleton_data.dart';
import 'dart:math';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  SingletonData singletonData = SingletonData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: makeBody(),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home)),
        title: Text(SingletonData().appName),
        automaticallyImplyLeading: false);
  }

  Widget makeBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 100, bottom: 100),
          child: const Text('The winner is:', style: TextStyle(fontSize: 30))),
      Text(getWinners(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
    ]);
  }

  String getWinners() {
    double? currentMax = 0;

    for (String key in singletonData.getVotePairs().keys) {
      if (singletonData.votePairs[key]! > currentMax!) {
        currentMax = singletonData.votePairs[key];
      }
    }

    List<String> winners = [];

    for (String key in singletonData.getVotePairs().keys) {
      if (singletonData.votePairs[key]! == currentMax!) {
        winners.add(key);
      }
    }
    if (!winners.isEmpty) {
      int randomIndex = Random().nextInt(winners.length);

      return winners[randomIndex];
    } else {
      return '';
    }
  }
}
