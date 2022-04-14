import 'package:flutter/material.dart';
import 'package:to_do_list/shared/custom_task_tile.dart';
import 'package:to_do_list/model/todo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  const HomeScreen({Key? key}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Todo> todos = [
    Todo(
      title: "Upload 1099-R to TurboTax",
      subtitle: "💰 Finance",
      isTaped: true,
    ),
    Todo(
      title: "Submit 2019 tax return",
      subtitle: "💰 Finance",
      isTaped: false,
    ),
    Todo(
      title: 'Print parking passes',
      subtitle: '💞 Wedding',
      isTaped: false,
    ),
    Todo(
      title: 'Sign contract, send back',
      subtitle: '🖥️ Freelance',
      isTaped: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Today"),
      ),
      body: CustomTaskTile(
        title: todos[index].title,
        subtitle: todos[index].subtitle,
        isTapedOnStart: todos[index].isTaped,
        isTapedCallack: (isTaped) {
          log(isTaped.toString());
          if (isTaped) {
            setState(() {
              todos[index].isTaped = false;
            }
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
                selectedIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          ]),
    );
  }
}
