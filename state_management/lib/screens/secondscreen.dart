import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/main.dart';
import 'package:state_management/screens/thirdscreen.dart';

import '../providers/namesProvider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text('First Screen')],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<NamesProvider>(
                builder: (ctx, namesProvider, child) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => ListTile(
                        title: Text((namesProvider.name[index])),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              namesProvider.name.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )),
                  itemCount: namesProvider.name.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ThirdScreen())),
        child: const Text("Navigate"),
      ),
    );
  }
}
