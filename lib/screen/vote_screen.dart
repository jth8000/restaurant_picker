import 'package:flutter/material.dart';
import 'package:restaurant_picker/screen/result_screen.dart';
import 'package:restaurant_picker/singleton/singleton_data.dart';
import 'package:restaurant_picker/timer.dart';

Map<String, double> votePairs = {};

class VoteScreen extends StatefulWidget {
  const VoteScreen({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<VoteScreen> {
  SingletonData singletonData = SingletonData();

  @override
  Widget build(BuildContext context) {
    singletonData.syncRestaurantNamesToPairs();
    return Scaffold(appBar: getAppBar(context), body: makeBody());
  }

  void goHome(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: const Text('Are you sure you want to leave?'),
                        actions: [
                          TextButton(
                            child: const Text('Stay'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                              child: const Text('Leave'),
                              onPressed: () {
                                goHome(context);
                              }),
                        ]);
                  });
            },
            icon: const Icon(Icons.home)),
        title: Text(SingletonData().appName),
        automaticallyImplyLeading: false);
  }

  Widget makeBody() {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(
          padding: EdgeInsets.only(top: 100, bottom: 50),
          child: Text('Vote!', style: TextStyle(fontSize: 24))),
      DecisionTimer(
          context: context,
          nextScreen: ResultScreen(),
          maxSeconds: SingletonData().secondsVoting),
      ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: createRestaurantItems(singletonData.getRestaurantNames()))
    ]));
  }

  List<Widget> createRestaurantItems(List<String> restaurants) {
    List<Widget> sliders = [];
    for (String name in restaurants) {
      sliders.add(SmartSlider(sliderLabel: name));
    }
    return sliders;
  }
}

class SmartSlider extends StatefulWidget {
  const SmartSlider({Key? key, required this.sliderLabel}) : super(key: key);

  final String sliderLabel;

  @override
  _SmartSliderState createState() =>
      _SmartSliderState(sliderLabel: sliderLabel);
}

class _SmartSliderState extends State<SmartSlider> {
  _SmartSliderState({required this.sliderLabel});
  final String sliderLabel;
  double sliderValue = 0;
  SingletonData singletonData = SingletonData();

  void changeSliderValue(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(sliderLabel, style: const TextStyle(fontSize: 18)),
      Slider(
        label: '$sliderValue',
        value: sliderValue,
        max: 10,
        min: 0,
        divisions: 10,
        onChanged: (double value) {
          changeSliderValue(value);
        },
        onChangeEnd: (double value) {
          singletonData.getVotePairs()[sliderLabel] = sliderValue;
        },
      ),
    ]);
  }
}
