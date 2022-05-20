import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/models.dart';
import 'package:flutter_firebase/screens/login_screen.dart';
import 'package:flutter_firebase/screens/register_screen.dart';
import 'package:flutter_firebase/screens/upload_image_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  final UserModel userModel;
  HomeScreen({this.userModel});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List<UserModel> allUsers = [];

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    configureFCM();
    configureLN();
    // TODO: implement initState
    super.initState();
  }

  configureLN() async {
    try {
      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid =
          new AndroidInitializationSettings('mipmap/ic_launcher');
      var initializationSettingsIOS = new IOSInitializationSettings();
      var initializationSettings = new InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: _selectNotification);
    } catch (e) {
      print(e);
    }
  }

  Future _selectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: const Text('Here is your payload'),
        content: new Text('Payload: $payload'),
      ),
    );
  }

  configureFCM() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      print(token);

      FirebaseMessaging.onBackgroundMessage((message) async {
        // print(message.notification.title);
      });

      FirebaseMessaging.onMessage.listen((event) {
        print(event);
      });
    } catch (e) {}
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'notification_channel_ID', 'channel Name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'New Post',
        'How to show notifications in Flutter', platformChannelSpecifics,
        payload: 'This is the text');
  }

  Future createDocument() async {
    var queryDoc = FirebaseFirestore.instance.collection("students").doc();
    try {
      await queryDoc.set({
        "name": nameController.text,
        "fatherName": fatherNameController.text,
        "age": int.parse(ageController.text),
        "studentId": queryDoc.id
      });
    } catch (e) {
      print(e);
    }
  }

  Future getSingleDocument() async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection("students")
          .doc("r2myePWzL12O8RUT7QTh")
          .get();
      print(documentSnapshot.data());
      UserModel userModel = UserModel.fromJson(documentSnapshot.data());
      print(userModel.name);
    } catch (e) {
      print(e);
    }
  }

  Future getManyDocuments() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("students")
        // .where("age", isGreaterThan: 25)
        .get();
    List<UserModel> _allUsers = [];

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      print(querySnapshot.docs[i].data());
      UserModel userModel = UserModel.fromJson(querySnapshot.docs[i].data());

      _allUsers.add(userModel);
    }
    print(_allUsers);
    setState(() {
      allUsers.addAll(_allUsers);
    });
  }

  Future deleteUser(String studentId) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(studentId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  await Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_) {
                    return LoginScreen();
                  }), (route) => false);
                } catch (e) {}
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.userModel != null
                ? Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Details",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(widget.userModel.name),
                          Text(widget.userModel.fatherName),
                          Text(widget.userModel.age.toString()),
                          Text(widget.userModel.studentId),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 15),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.blue.shade300,
                        ))),
              ),
            ),
            TextFormField(
              controller: fatherNameController,
              decoration: InputDecoration(
                  hintText: "Father's Name",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.blue.shade300,
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Age",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.blue.shade300,
                      ))),
            ),
            ElevatedButton(onPressed: createDocument, child: Text("Submit")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
                child: Text("Register")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text("LOGIN")),
            ElevatedButton(
                onPressed: getManyDocuments, child: Text("Get All Documents")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                },
                child: Text("Upload File")),
            ElevatedButton(
                onPressed: _showNotificationWithDefaultSound,
                child: Text("Show notification with default sound")),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: allUsers.length,
                itemBuilder: (_, i) {
                  return ListTile(
                    title: Column(
                      children: [
                        Text("Name: ${allUsers[i].name}"),
                        Text("StudentId: ${allUsers[i].studentId}"),
                      ],
                    ),
                    subtitle: Text("Age: ${allUsers[i].age}"),
                    trailing: IconButton(
                        onPressed: () {
                          deleteUser(allUsers[i].studentId);
                          // allUsers.removeWhere((UserModel user) => user.studentId==allUsers[i].studentId);
                          setState(() {
                            allUsers.removeAt(i);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                })
          ],
        ),
      ),
    );
  }
}
