import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:api_networking/models/userModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'API & Networking',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    getUserById();
  }

  int id = 0;
  String name = 'Default', username = 'Default', email = 'Default';

  UserModel userModel = UserModel(
    id: 0,
    name: '',
    username: '',
    email: '',
  );

  Future<void> getUserById({String id = '1'}) async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users/$id');
      print(response);
      if (response.statusCode == 200 &&
          (response.data as Map<String, dynamic>).isNotEmpty) {
        setState(() {
          // this.id = response.data['id'];
          // name = response.data['name'];
          // username = response.data['username'];
          // email = response.data['email'];

          // userModel = UserModel(
          //   id: response.data['id'],
          //   name: response.data['name'],
          //   username: response.data['username'],
          //   email: response.data['email'],
          // );
          userModel = UserModel.fromJson(response.data);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${userModel.id}'),
            Text('Name: ${userModel.name}'),
            Text('Username: ${userModel.username}'),
            Text('Email: ${userModel.email}'),
            Text('ADDRESS DETAILS'),
            Text('City: ${userModel.address.city}'),
            Text('Street: ${userModel.address.street}'),
            Text('Suite: ${userModel.address.suite}'),
          ],
        ),
      ),
    );
  }
}
