import 'package:flutter/material.dart';
import 'package:restaurant_picker/screen/vote_screen.dart';
import 'package:restaurant_picker/singleton/singleton_data.dart';
import 'package:restaurant_picker/timer.dart';
import 'package:restaurant_picker/widget/restaurant_item.dart';
import 'package:restaurant_picker/widget/button.dart';
import 'package:restaurant_picker/widget/standard_text_field.dart';

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: makeBody(context),
    );
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

  Widget makeBody(BuildContext context) {
    return const RestaurantAdditionBody();
  }
}

class RestaurantAdditionBody extends StatefulWidget {
  const RestaurantAdditionBody({Key? key}) : super(key: key);

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<RestaurantAdditionBody> {
  TextEditingController restaurantNameController = TextEditingController();
  SingletonData singletonData = SingletonData();

  void addRestaurantItem() {
    if (mounted) {
      setState(() {
        singletonData.getRestaurantNames().add(restaurantNameController.text);
        restaurantNameController.clear();
      });
    }
  }

  void removeRestaurantItem(int index) {
    if (mounted) {
      setState(() {
        singletonData.getRestaurantNames().removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 30),
      const Text('Brainstorm Go!', style: TextStyle(fontSize: 24)),
      const SizedBox(height: 10),
      DecisionTimer(
          context: context,
          nextScreen: const VoteScreen(),
          maxSeconds: SingletonData().secondsBrainstorm),
      const SizedBox(height: 10),
      SizedBox(
          width: 400,
          height: 200,
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                singletonData.getRestaurantNames().isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: singletonData.getRestaurantNames().length,
                        itemBuilder: (BuildContext context, int index) {
                          return RestaurantItem(
                            name: singletonData.getRestaurantNames()[index],
                            callback: () {
                              removeRestaurantItem(index);
                            },
                          );
                        })
                    : const Center(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('No restaurants added yet.'))),
              ]))),
      const SizedBox(height: 10),
      Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
            width: 200,
            height: 50,
            child: StandardTextField(
                textController: restaurantNameController,
                text: 'Add restaurant')),
        ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () {
              addRestaurantItem();
            }),
      ])),
      const SizedBox(height: 20),
      StandardButton(
          buttonText: 'I\'m Done',
          callback: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const VoteScreen()));
          })
    ]));
  }
}
