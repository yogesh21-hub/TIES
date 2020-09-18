import 'package:flutter/material.dart';

import 'package:TIES/widgets/onewordquestion.dart';
import 'package:TIES/widgets/mcqquestion.dart';
import 'package:TIES/widgets/true-falsequestion.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  int type = 1;
  @override
  Widget build(BuildContext context) {
    final value =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Q${value['number']}"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose the question type",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text("One Word"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("MCQ"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("True/False"),
                    value: 3,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    type = value;
                  });
                },
                elevation: 5,
                value: type,
              )
            ],
          ),
          if (type == 1)
            OneWord(value['addQuestion']),
          // if (type == 2) MCQ(value['addQuestion']),
          // if (type == 3) TrueFalse(value['addQuestion'])
        ],
      ),
    );
  }
}
