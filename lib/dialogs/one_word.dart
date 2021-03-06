import 'package:TIES/dialogs/add_ques_dialog.dart';
import 'package:TIES/dialogs/true_falsedialog.dart';
import 'package:TIES/providers/question.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:flutter/material.dart';

class OneWord extends StatefulWidget {
  final String quizid;
  final String date;
  final String name;
  OneWord({this.date, this.name, this.quizid});
  @override
  _OneWordState createState() => _OneWordState();
}

class _OneWordState extends State<OneWord> {
  String question;
  String correctAnswer;
  TextEditingController _textEditingController;

  var _formkey = GlobalKey<FormState>();
  var _optionkey = GlobalKey<FormState>();
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
                            child: Text('One Word'),
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
                                            MediaQuery.of(context).size.width -
                                                7,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                'Change Question Type',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(),
                                            ListTile(
                                              title: Center(
                                                  child: Text(
                                                'Multiple Choice',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddQuesDialog(
                                                            date: widget.date,
                                                            name: widget.name,
                                                            quizid:
                                                                widget.quizid,
                                                          )),
                                                );
                                              },
                                            ),
                                            Divider(),
                                            ListTile(
                                              title: Center(
                                                  child: Text(
                                                'True-False',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TrueFalse()));
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
                          style:
                              TextStyle(fontSize: 17, color: Color(0xffAFAFAF)),
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
                            style: TextStyle(
                                color: Color(0xffFF0000), fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Form(
                    key: _optionkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                          ),
                          alignLabelWithHint: true,
                          hintText: 'Enter Answer',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (value) {
                          correctAnswer = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) return 'Enter an Answer';
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ))),
      bottomNavigationBar: MaterialButton(
        minWidth: double.infinity,
        height: 71,
        onPressed: () async {
          _formkey.currentState.save();
          _optionkey.currentState.save();
          if (_formkey.currentState.validate() &&
              _optionkey.currentState.validate()) {
            QuestionItem data = QuestionItem(
                question: question,
                answers: [],
                difficulty: "easy",
                type: "One Word",
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
