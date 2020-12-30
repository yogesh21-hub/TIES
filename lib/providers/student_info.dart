import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentInfo {
  String uid;
  String name;
  String email;
  int rollno;
  String batch;

  Future setCredentials(String uid) async {
    try {
      DocumentSnapshot instance = await FirebaseFirestore.instance
          .collection("students")
          .doc(uid)
          .get();
      Map data = instance.data();
      this.uid = uid;
      name = data['name'];
      email = data['email'];
      rollno = data['rollno'];
      batch = data['batch'];
    } catch (e) {
      print(e.toString());
    }
  }
}
