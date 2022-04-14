import 'package:flutter/material.dart';
import 'package:music_app/homeScreen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          HomeScreen(),
          Text("Search"),
          Text("Your Library"),
          Text("Premium"),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            pageController.jumpToPage(index);
          },
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Your Library"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Premium"),
          ],
        ),
      ),
    );
  }
}
