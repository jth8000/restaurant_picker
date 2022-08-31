import 'package:flutter/material.dart';
import 'widget/button.dart';
import 'package:restaurant_picker/screen/group_screen.dart';
import 'package:restaurant_picker/screen/standard_screen.dart';
import 'package:restaurant_picker/singleton/singleton_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: SingletonData().appName,
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: '/',
        home: HomePage(title: SingletonData().appName));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: homeScreenBody(context),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Food Consensus Rundown'),
                      content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                                "Food Consensus is a decision flow to help groups quickly decide on a restaurant to eat at.",
                                textAlign: TextAlign.center),
                            Text("The decision flow occurs in four steps:",
                                textAlign: TextAlign.center),
                            Text(
                                "1. Creating or joining a group for the decision flow",
                                textAlign: TextAlign.left),
                            Text(
                                "2. Brainstorming restaurants to add to the list",
                                textAlign: TextAlign.left),
                            Text("3. Voting on the restaurants added",
                                textAlign: TextAlign.left),
                            Text("4. Tallying scores and displaying the winner",
                                textAlign: TextAlign.left)
                          ]),
                      actions: [
                        TextButton(
                          child: const Text('Got It!'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.help)));
  }

  Widget homeScreenBody(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        StandardButton(
            buttonText: 'Create Group',
            callback: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GroupScreen(title: title, createGroup: true)));
            }),
        StandardButton(
          buttonText: 'Join Group',
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GroupScreen(title: title, createGroup: false)));
          },
        )
      ]),
    );
  }
}
