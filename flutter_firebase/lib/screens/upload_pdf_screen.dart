import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class UploadPdfScreen extends StatefulWidget {
  @override
  State<UploadPdfScreen> createState() => _UploadPdfScreenState();
}

class _UploadPdfScreenState extends State<UploadPdfScreen> {
  PlatformFile pickedFile;

  Future selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) return null;

      setState(() {
        pickedFile = result.files.first;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future uploadFile() async {
    try {
      final path = 'files/${pickedFile.name}';
      final file = File(pickedFile.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (pickedFile != null)
            Expanded(
              child: Container(
                color: Colors.blue[100],
                child: Center(
                  child: Text(pickedFile.name),
                ),
              ),
            ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: selectFile, child: Text('Select FIle')),
          ElevatedButton(onPressed: uploadFile, child: Text('Upload FIle')),
        ],
      ),
    );
  }
}
