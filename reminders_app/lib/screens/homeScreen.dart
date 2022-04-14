import 'package:flutter/material.dart';
import 'package:reminders_app/shared/remindersList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> reminders = [
    "Friends Meetup",
    "Mathematics Assignment",
    "Team Meeting",
    "Team Meeting1",
    "Team Meeting2",
    "Team Meeting3",
    "Team Meeting4",
    "Team Meeting5"
  ];
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("My Reminders"),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tasks Completed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Switch(
                          value: isSwitched,
                          activeColor: Colors.deepPurple.shade200,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: reminders.length,
                itemBuilder: (ctx, i) {
                  return RemindersTile(
                      showChecked: isSwitched, currentReminder: reminders[i]);
                },
              ),
            ]),
          ),
        ));
  }
}
