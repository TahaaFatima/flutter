import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/namesProvider.dart';
import 'package:state_management/screens/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NamesProvider>(
          create: (_) => NamesProvider(),
        )
      ],
      builder: (ctx, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
