import 'dart:io';

import 'package:TIES/dialogs/teacher_profile_dialog.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

class UploadCheckedSheets extends StatefulWidget {
  @override
  _UploadCheckedSheetsState createState() => _UploadCheckedSheetsState();
}

class _UploadCheckedSheetsState extends State<UploadCheckedSheets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Checked Sheets'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherProfileDialog()));
            },
            icon: Icon(Icons.menu)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles();

            if (result != null) {
              File file = File(result.files.single.path);
            } else {
              // User canceled the picker
            }
          },
          icon: Icon(Icons.add),
          label: Text('Upload')),
    );
  }
}
