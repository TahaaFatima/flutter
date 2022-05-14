import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
//import 'package:image_picker/image_picker.dart';

class UploadPDFScreen extends StatefulWidget {
  @override
  State<UploadPDFScreen> createState() => _UploadPDFScreenState();
}

class _UploadPDFScreenState extends State<UploadPDFScreen> {
  File selectedFile;
  /*  uploadPDF() async {
    try {
      if (selectedFile != null) {
        Uint8List fileBytes = result.files.first.bytes;
        String fileName = result.files.first.name;

        // Upload file
        await FirebaseStorage.instance
            .ref('uploads/$fileName')
            .putData(fileBytes);
      }
    } catch (e) {
      print(e);
    }
  } */

  selectPDF() async {
    try {
      // opens storage to pick files and the picked file or files
      // are assigned into result and if no file is chosen result is null.
      // you can also toggle "allowMultiple" true or false depending on your need
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      // if no file is picked
      if (result == null) return;

      if (result != null) {
        Uint8List fileBytes = result.files.first.bytes;
        String fileName = result.files.first.name;

        // Upload file
        await FirebaseStorage.instance
            .ref('uploads/$fileName')
            .putData(fileBytes);
      }
      ;

      // setState(() {
      //   File selectedFile = File(result.files.single.path);
      // });

      // we will log the name, size and path of the
      // first picked file (if multiple are selected)
      print(result.files.first.name);
      print(result.files.first.size);
      print(result.files.first.path);
    } on PlatformException {
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
                    onTap: selectPDF,
                    child: Icon(Icons.camera),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: uploadPDF,
        child: Text("Upload"),
      ), */
    );
  }
}
