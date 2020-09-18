import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
  final String text;
  final callingLoginScreen;
  ButtonDesign({this.text, this.callingLoginScreen});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: RaisedButton(
        elevation: 0,
        onPressed: callingLoginScreen,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
        color: Colors.redAccent[200],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
        ),
        ClipOval(
          child: Image.asset(
            "./assets/images/ti logo.jpeg",
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 45,
          ),
        ),
        Text(
          "Login as",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        ButtonDesign(
          text: "Teacher",
          callingLoginScreen: () {
            Navigator.of(context).pushNamed('/teacher-login');
          },
        ),
        SizedBox(
          height: 20,
        ),
        ButtonDesign(
          text: "Student",
          callingLoginScreen: () {
            Navigator.of(context).pushNamed('/student-login');
          },
        )
      ],
    ));
  }
}
