import 'package:flutter/material.dart';

class RemindersTile extends StatefulWidget {
  String currentReminder;
  bool showChecked;
  RemindersTile({required this.showChecked, required this.currentReminder});
  @override
  State<RemindersTile> createState() => _RemindersTileState();
}

class _RemindersTileState extends State<RemindersTile> {
  bool _isVisible = true;
  Object? value = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Visibility(
        visible: widget.showChecked ? !_isVisible : _isVisible,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: !_isVisible,
                      activeColor: Colors.green,
                      onChanged: (data) => {
                            setState(() => {
                                  print(data),
                                  this.value = data,
                                  _isVisible = !_isVisible
                                })
                          }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.currentReminder,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
