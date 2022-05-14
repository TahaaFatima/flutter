import 'package:flutter/material.dart';

class FutureStreamBuilderScreen extends StatefulWidget {
  const FutureStreamBuilderScreen({Key key}) : super(key: key);

  @override
  State<FutureStreamBuilderScreen> createState() =>
      _FutureStreamBuilderScreenState();
}

class _FutureStreamBuilderScreenState extends State<FutureStreamBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* body: Column(
        children: [
          TabBar(controller: tabController, tabs: [
            Tab(
              text: "Future Builder",
            ),
            Tab(
              text: "Stream Builder",
            )
          ])
        ],
      ), */
        );
  }
}
