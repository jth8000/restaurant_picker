import 'package:flutter/material.dart';
import 'package:restaurant_picker/screen/add_restaurant.dart';
import 'package:restaurant_picker/widget/button.dart';
import 'package:restaurant_picker/widget/participant_at_start.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      {Key? key,
      required this.title,
      required this.groupController,
      required this.nameController})
      : super(key: key);

  final String title;
  final TextEditingController groupController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(context), body: getScreenBody(context));
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        title: Text(title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  Widget getScreenBody(BuildContext context) {
    String groupName = groupController.text;
    return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Group: $groupName',
                          style: const TextStyle(fontSize: 30)))),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView(children: [
                ParticipantAtStart(participantName: 'Joe', ready: true),
                const SizedBox(height: 40.0),
                ParticipantAtStart(participantName: 'Sue', ready: true),
                const SizedBox(height: 40.0),
                ParticipantAtStart(participantName: 'Carl', ready: true)
              ])),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 300),
                      child: StandardButton(
                          buttonText: 'Ready',
                          callback: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddRestaurantScreen()),
                                ModalRoute.withName('/'));
                          })))
            ]));
  }
}
