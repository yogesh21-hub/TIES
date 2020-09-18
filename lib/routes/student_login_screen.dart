import 'package:flutter/material.dart';

import '../services/auth.dart';

class StudentLoginScreen extends StatefulWidget {
  @override
  _StudentLoginScreenState createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final _key = GlobalKey<FormState>();
  String username;
  String password;
  bool credentialTrue = true;
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
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      onPressed: () {},
                      // onPressed: () async {
                      //   _key.currentState.save();
                      //   _key.currentState.validate();
                      //   // dynamic user = await Authentication()
                      //   //     .signIn(email: username, password: password);
                      //   // if (user == null)
                      //   //   setState(() {
                      //   //     credentialTrue = false;
                      //   //   });
                      // },
                      color: Colors.red,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 75),
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
                      "Wrong username or password",
                      style: TextStyle(color: Colors.red),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
