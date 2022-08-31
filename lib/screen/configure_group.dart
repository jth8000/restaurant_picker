import 'package:flutter/material.dart';
import 'package:restaurant_picker/widget/checkbox_row.dart';
import 'package:restaurant_picker/widget/numerical_text_field.dart';
import 'package:restaurant_picker/singleton/singleton_data.dart';

class ConfigureGroupSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        title: Text(SingletonData().appName),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}

class ConfigureGroup extends StatefulWidget {
  ConfigureGroup({Key? key, required this.groupName}) : super(key: key);
  final String groupName;
  @override
  _ConfigurationState createState() =>
      _ConfigurationState(groupName: groupName);
}

class _ConfigurationState extends State<ConfigureGroup> {
  _ConfigurationState({required this.groupName});

  final String groupName;
  List<Widget> configurationWidgetList = [];
  bool setBrainstormTimer = false;
  bool setVotingTimer = false;
  bool setLimitOnRestaurantAddition = false;
  TextEditingController brainStormSecondsController = TextEditingController();
  TextEditingController votingSecondsController = TextEditingController();
  TextEditingController restaurantLimitController = TextEditingController();

  void changeSetBrainstormTimer() {
    setState(() {
      setBrainstormTimer = !setBrainstormTimer;
    });
  }

  void changeSetVotingTimer() {
    setState(() {
      setVotingTimer = !setVotingTimer;
    });
  }

  void changeSetLimitOnRestaurantAddition() {
    setState(() {
      setLimitOnRestaurantAddition = !setLimitOnRestaurantAddition;
    });
  }

  List<Widget> getConfigurationWidgetList() {
    List<Widget> widgetList = [];

    if (setBrainstormTimer) {}

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(groupName, style: const TextStyle(fontSize: 24)),
        CheckboxRow(
            rowText: 'Include timer for adding restaurants?',
            callback: () {
              changeSetBrainstormTimer();
            }),
        Visibility(
            child: NumericalTextField(
                textController: brainStormSecondsController,
                text: 'Timer seconds for adding restaurants'),
            visible: setBrainstormTimer),
        CheckboxRow(
          rowText: 'Include timer for voting?',
          callback: () {
            changeSetVotingTimer();
          },
        ),
        Visibility(
            child: NumericalTextField(
                textController: votingSecondsController,
                text: 'Timer seconds for voting'),
            visible: setVotingTimer),
        CheckboxRow(
            rowText: 'Set limit on how many restaurants each person can add?',
            callback: () {
              changeSetLimitOnRestaurantAddition();
            }),
        Visibility(
            child: NumericalTextField(
                textController: restaurantLimitController,
                text: 'Restaurant addition limit'),
            visible: setLimitOnRestaurantAddition)
      ],
    );
  }
}
