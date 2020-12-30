import 'package:TIES/routes/score_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class TrueFalseQuestion extends StatefulWidget {
  @override
  _TrueFalseQuestionState createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 180;

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

  @override
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
                    context, MaterialPageRoute(builder: (context) => Score()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  final String text;
  Options(this.text);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xff707070)),
              left: BorderSide(width: 1.0, color: Color(0xff707070)),
              right: BorderSide(width: 1.0, color: Color(0xff707070)),
              bottom: BorderSide(width: 1.0, color: Color(0xff707070)),
            ),
            color: isSelected ? Colors.red : Colors.white,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
