import 'dart:math';

import 'package:TIES/dialogs/one_word.dart';
import 'package:TIES/dialogs/true_falsedialog.dart';
import 'package:TIES/providers/question.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:flutter/material.dart';

class AddQuesDialog extends StatefulWidget {
  final String quizid;
  final String date;
  final String name;
  AddQuesDialog({this.quizid, this.date, this.name});
  @override
  _AddQuesDialogState createState() => _AddQuesDialogState();
}

class _AddQuesDialogState extends State<AddQuesDialog> {
  //question data
  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;

  TextEditingController _textEditingController;
  bool aVal = false;
  bool bVal = false;
  bool cVal = false;
  bool dVal = false;
  var _formkey = GlobalKey<FormState>();
  var _optionkey1 = GlobalKey<FormState>();
  var _optionkey2 = GlobalKey<FormState>();
  var _optionkey3 = GlobalKey<FormState>();
  var _optionkey4 = GlobalKey<FormState>();

  void setQuestion(String value) {
    question = value;
  }

  void setAnswer1(String value) {
    answer1 = value;
  }

  void setAnswer2(String value) {
    answer2 = value;
  }

  void setAnswer3(String value) {
    answer3 = value;
  }

  void setAnswer4(String value) {
    answer4 = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 71,
                color: Color(0xffFF0000).withOpacity(0.75),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                        child: Text(
                      'Data Structures and',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      'Algorithms',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 11.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      widget.name ?? "UCS742",
                      style: TextStyle(
                          color: Color(0xffD33030),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: Text(
                      widget.date ?? "24/12/2020",
                      style: TextStyle(
                          color: Color(0xffD33030),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      alignLabelWithHint: true,
                      hintText: 'Enter Question',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (value) {
                      question = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) return 'Enter a Question';
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Multiple Choice'),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    height: 210,
                                    width:
                                        MediaQuery.of(context).size.width - 7,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            'Change Question Type',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(),
                                        ListTile(
                                          title: Center(
                                              child: Text(
                                            'OneWord',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OneWord(
                                                          date: widget.date,
                                                          name: widget.name,
                                                          quizid: widget.quizid,
                                                        )));
                                          },
                                        ),
                                        Divider(),
                                        ListTile(
                                          title: Center(
                                              child: Text(
                                            'True-False',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TrueFalse(
                                                            date: widget.date,
                                                            name: widget.name,
                                                            quizid: widget
                                                                .quizid)));
                                          },
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Add Image (if required)',
                      style: TextStyle(fontSize: 17, color: Color(0xffAFAFAF)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: MaterialButton(
                      height: 36,
                      minWidth: 145,
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Insert Image',
                        style:
                            TextStyle(color: Color(0xffFF0000), fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Row(
                children: [
                  SetOptions('Option A', _optionkey1, setAnswer1),
                  SetOptions('Option B', _optionkey2, setAnswer2),
                ],
              ),
              Row(
                children: [
                  SetOptions('Option C', _optionkey3, setAnswer3),
                  SetOptions('Option D', _optionkey4, setAnswer4),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text(
                      'Correct Answer:',
                      style: TextStyle(color: Color(0xff3D3C3C), fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("A"),
                        Checkbox(
                          value: aVal,
                          onChanged: (bool value) {
                            setState(() {
                              aVal = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("B"),
                      Checkbox(
                        value: bVal,
                        onChanged: (bool value) {
                          setState(() {
                            bVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("C"),
                      Checkbox(
                        value: cVal,
                        onChanged: (bool value) {
                          setState(() {
                            cVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("D"),
                      Checkbox(
                        value: dVal,
                        onChanged: (bool value) {
                          setState(() {
                            dVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MaterialButton(
        minWidth: double.infinity,
        height: 71,
        onPressed: () async {
          _formkey.currentState.save();
          _optionkey1.currentState.save();
          _optionkey2.currentState.save();
          _optionkey3.currentState.save();
          _optionkey4.currentState.save();

          bool a = _formkey.currentState.validate();
          bool b = _optionkey1.currentState.validate();
          bool c = _optionkey2.currentState.validate();
          bool d = _optionkey3.currentState.validate();
          bool e = _optionkey4.currentState.validate();
          if (a && b && c && d && e) {
            String correctAnswer;
            if (aVal)
              correctAnswer = answer1;
            else if (bVal)
              correctAnswer = answer2;
            else if (cVal)
              correctAnswer = answer3;
            else
              correctAnswer = answer4;
            List<String> type = ["easy", "medium", "difficulty"];
            QuestionItem data = QuestionItem(
                question: question,
                answers: [answer1, answer2, answer3, answer4],
                difficulty: type[Random().nextInt(3)],
                type: "Multiple Choice",
                correctAnswer: correctAnswer);
            await QuizItem().uploadQuestion(widget.quizid, data);
            Navigator.of(context).pop();
          }
        },
        color: Color(0xffFF0000).withOpacity(0.75),
        child: Text(
          'CONFIRM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class SetOptions extends StatefulWidget {
  String text;
  var _optionkey;
  final Function setAnswer;
  SetOptions(this.text, this._optionkey, this.setAnswer);
  @override
  _SetOptionsState createState() => _SetOptionsState();
}

class _SetOptionsState extends State<SetOptions> {
  TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Form(
        key: widget._optionkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: _textEditingController,
            validator: (value) {
              if (value.isEmpty) return "Option Required";
              return null;
            },
            onSaved: widget.setAnswer,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
              alignLabelWithHint: true,
              hintText: widget.text,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
