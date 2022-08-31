import 'package:flutter/material.dart';
import 'package:restaurant_picker/screen/start_screen.dart';
import 'package:restaurant_picker/widget/button.dart';
import 'package:restaurant_picker/widget/standard_text_field.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({Key? key, required this.title, required this.createGroup})
      : super(key: key);

  final String title;
  final bool createGroup;
  final TextEditingController groupController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context), body: makeGroupScreenBody(context));
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

  Widget makeGroupScreenBody(BuildContext context) {
    String buttonText = '';

    if (createGroup) {
      buttonText = 'Create Group';
    } else {
      buttonText = 'Join Group';
    }

    return Center(
        child: SizedBox(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              StandardTextField(
                  textController: groupController, text: 'Enter Group Name'),
              const SizedBox(height: 30.0),
              StandardTextField(
                  textController: nameController, text: 'Enter Your Name'),
              StandardButton(
                  buttonText: buttonText,
                  callback: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StartScreen(
                          title: title,
                          groupController: groupController,
                          nameController: nameController);
                    }));
                  })
            ])));
  }
}
