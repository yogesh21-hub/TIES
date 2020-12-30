import 'dart:async';

import 'package:TIES/routes/true_false_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextQuestion extends StatefulWidget {
  @override
  _TextQuestionState createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  
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
    SystemChrome.setEnabledSystemUIOverlays([]);
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
