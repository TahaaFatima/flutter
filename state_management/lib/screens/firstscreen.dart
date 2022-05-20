import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/main.dart';
import 'package:state_management/providers/namesProvider.dart';
import 'package:state_management/screens/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FirstScreen")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<NamesProvider>(
                builder: (ctx, namesProvider, child) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => ListTile(
                        title: Text(namesProvider.name[index]),
                        trailing: IconButton(
                          onPressed: () {
                            namesProvider.name.removeAt(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )),
                  itemCount: namesProvider.name.length,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SecondScreen())),
        child: Text("Navigate"),
      ),
    );
  }
}
