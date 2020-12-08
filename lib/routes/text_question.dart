import 'dart:async';

import 'package:TIES/routes/true_false_question.dart';
import 'package:flutter/material.dart';

class TextQuestion extends StatefulWidget {
  @override
  _TextQuestionState createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  TextEditingController _textEditingController;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 210;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 - 20,
                width: double.infinity,
                color: Color(0xffFF0000).withOpacity(0.75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 56.0, left: 22),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            size: 31,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            timerText,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 125.0),
                            child: Text(
                              'Question 2/4',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 39),
                      child: Text(
                        '_____________ is an example of a Data Structure.',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Answer'),
                  maxLines: 100,
                  minLines: 100,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                height: 54,
                minWidth: 209,
                color: Color(0xffD33030),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'Confirm Selection',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrueFalseQuestion()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
