import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherInfo {
  String uid;
  String name;
  String email;

  Future setCredentials(String uid) async {
    try {
      DocumentSnapshot instance = await FirebaseFirestore.instance
          .collection("teachers")
          .doc(uid)
          .get();
      Map data = instance.data();
      this.uid = uid;
      name = data['name'];
      email = data['email'];
    } catch (e) {
      print(e.toString());
    }
  }
}
