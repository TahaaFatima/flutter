import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/main.dart';

import '../providers/namesProvider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<NamesProvider>(
                builder: (ctx, namesProvider, child) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => ListTile(
                        title: Text(namesProvider.name[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                namesProvider.editItem(
                                    index, "New Edited Name");
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                namesProvider.deleteItem(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      )),
                  itemCount: namesProvider.name.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
