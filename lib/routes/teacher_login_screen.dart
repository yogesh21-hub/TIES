import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import 'package:TIES/providers/quiz.dart';

class TeacherLoginScreen extends StatefulWidget {
  @override
  _TeacherLoginScreenState createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  final _key = GlobalKey<FormState>();
  String username;
  String password;
  bool credentialTrue = true;
  String authResponse = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Text("Login"),
          SizedBox(
            height: 20,
          ),
          ClipOval(
              child: Image.asset(
            './assets/images/ti logo.jpeg',
            width: 80,
            height: 80,
          )),
          SizedBox(
            height: 20,
          ),
          Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: TextFormField(
                          onSaved: (value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Username",
                              fillColor: Colors.red[100],
                              filled: true,
                              prefixIcon: Icon(Icons.person))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                            onSaved: (value) {
                              password = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.red[100],
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                            )),
                      )),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: RaisedButton(
              onPressed: () async {
                _key.currentState.save();
                if (_key.currentState.validate()) {
                  dynamic result = await Authentication()
                      .signIn(email: username, password: password);
                  if (result == "Yes") {
                    print("Signed in");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/teacher-home', ModalRoute.withName('./'));
                  } else {
                    setState(() {
                      credentialTrue = false;
                      authResponse = result;
                    });
                  }
                }
              },
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (credentialTrue == false)
            Text(
              authResponse != null ? authResponse : "",
              style: TextStyle(color: Colors.red),
            )
        ],
      ),
    );
  }
}
