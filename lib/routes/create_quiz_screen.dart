import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:TIES/routes/create_question_screen.dart';
import '../providers/question.dart';

class CreateQuizScreen extends StatefulWidget {
  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  String subject;
  int number;
  int duration;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Quiz"),
        ),
        body: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(labelText: "Name of the Subject"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) => number = int.parse(value),
                  decoration: InputDecoration(labelText: "Number of the Quiz"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) => duration = int.parse(value),
                  decoration:
                      InputDecoration(labelText: "Duration of the Quiz"),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    _key.currentState.save();
                    if (_key.currentState.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) =>
                              CreateQuestionScreen(subject, number, duration)));
                    }
                  },
                  child: Text("Next"),
                )
              ],
            )));
  }
}
