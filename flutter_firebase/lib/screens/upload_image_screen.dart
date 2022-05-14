import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File selectedFile;
  upload() async {
    try {
      if (selectedFile != null) {
        final response = await FirebaseStorage.instance
            .ref("images")
            .child('firstImage')
            .putFile(selectedFile);
        final downloadURL = await response.ref.getDownloadURL();

        FirebaseFirestore.instance.collection('storageLinks').doc('media').set({
          'image': downloadURL,
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
    }
  }

  selectImage() async {
    try {
      final pickedFile =
          // await ImagePicker().getImage(source: ImageSource.camera);
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      setState(() {
        selectedFile = File(pickedFile.path);
      });
    } on PlatformException catch (e) {
      print("permission denied");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      selectedFile == null ? null : FileImage(selectedFile),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: selectImage,
                    child: Icon(Icons.camera),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: upload,
        child: Text("Upload"),
      ),
    );
  }
}
