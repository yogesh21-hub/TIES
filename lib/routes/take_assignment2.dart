import 'dart:async';

import 'package:flutter/material.dart';

class TakeAssignment2 extends StatefulWidget {
  @override
  _TakeAssignment2State createState() => _TakeAssignment2State();
}

class _TakeAssignment2State extends State<TakeAssignment2> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 300;

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
                            'Question 1/4',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 39),
                    child: Text(
                      'In the worst case, the number of comparisons needed to search a singly linked list of length n for a given element is:',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Options('n/2'),
            SizedBox(
              height: 9,
            ),
            Options('log n'),
            SizedBox(
              height: 9,
            ),
            Options('n/2'),
            SizedBox(
              height: 9,
            ),
            Options('n/2'),
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
              onPressed: () {},
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
