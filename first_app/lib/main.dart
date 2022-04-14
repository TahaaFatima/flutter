import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int time = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text('Taha Fatima'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Text(
            'You have clicked this button time times.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                primary: Colors.purple.shade400,
              ),
              onPressed: () {
                setState(() {
                  time++;
                });
              },
              child: Text('Click Me'))
        ],
      ),
    );
  }
}
