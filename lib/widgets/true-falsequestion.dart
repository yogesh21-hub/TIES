import 'package:flutter/material.dart';

import '../providers/question.dart';

class TrueFalse extends StatefulWidget {
  @override
  _TrueFalseState createState() => _TrueFalseState();

  final addQuestion;
  TrueFalse(this.addQuestion);
}

class _TrueFalseState extends State<TrueFalse> {
  String question;
  String correctAnswer;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(children: <Widget>[
          TextFormField(
            onSaved: (value) => question = value,
            textInputAction: TextInputAction.newline,
            maxLines: 3,
            decoration: InputDecoration(
                labelText: "Question", labelStyle: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onSaved: (value) => question = value,
            textInputAction: TextInputAction.newline,
            maxLines: 2,
            decoration: InputDecoration(
                labelText: "Correct Answer",
                labelStyle: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                _key.currentState.save();
                if (_key.currentState.validate()) {
                  widget.addQuestion(QuestionItem(
                      question: question,
                      correctAnswer: correctAnswer,
                      answers: [],
                      questionid: DateTime.now().toIso8601String()));
                  Navigator.of(context).pop();
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Add Question",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 25),
                ),
              ),
            ),
          )
        ]));
  }
}
