import 'dart:async';

import 'package:TIES/providers/question.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/routes/score_screen.dart';
import 'package:TIES/routes/text_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TakeAssignment2 extends StatefulWidget {
  final String quizid;
  TakeAssignment2({this.quizid});
  @override
  _TakeAssignment2State createState() => _TakeAssignment2State();
}

class _TakeAssignment2State extends State<TakeAssignment2> {
  QuizItem item;
  int duration;
  List<String> givenAnswers = [];
  int _end;
  int currentQuestion = 1;
  int totalQuestion;
  List<QuestionItem> questions;

  void setAnswers(String answer) {
    givenAnswers.add(answer);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    QuizItem().getQuizItem(widget.quizid).then((value) {
      setState(() {
        item = value;
        duration = item.duration;
        totalQuestion = item.questions.length;
        questions = item.questions;
        Timer(Duration(minutes: duration), _endQuiz);
        _end = item.duration * 60;
        startTimer();
      });
    });
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_end == 0)
        setState(() {
          timer.cancel();
        });
      else {
        setState(() {
          _end--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  void _endQuiz() {
    int score = 0;
    double percentage;
    int i = 0;
    givenAnswers.forEach((element) {
      if (element.toLowerCase() == questions[i].correctAnswer.toLowerCase()) {
        score++;
        i++;
      }
    });
    percentage = ((i * 100) / questions.length).toDouble();
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Score(
                score: score,
                percentage: percentage,
                total: questions.length)));
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();

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
            if (item.questions[currentQuestion - 1].type == "Multiple Choice")
              MCQ(
                setAnswers: setAnswers,
                question: questions[currentQuestion - 1].question,
                currentQuestion: currentQuestion,
                totalQuestion: totalQuestion,
                end: _end,
                option1: questions[currentQuestion - 1].answers[0],
                option2: questions[currentQuestion - 1].answers[1],
                option3: questions[currentQuestion - 1].answers[2],
                option4: questions[currentQuestion - 1].answers[3],
              ),
            if (item.questions[currentQuestion - 1].type == "One Word")
              OneWord(
                question: questions[currentQuestion - 1].question,
                currentQuestion: currentQuestion,
                totalQuestion: totalQuestion,
                setAnswers: setAnswers,
                key: key,
                end: _end,
              ),
            if (item.questions[currentQuestion - 1].type == "True/False")
              TrueFalse(
                question: questions[currentQuestion - 1].question,
                currentQuestion: currentQuestion,
                totalQuestion: totalQuestion,
                setAnswers: setAnswers,
                end: _end,
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
                if (currentQuestion == totalQuestion) {
                  int score = 0;
                  double percentage;
                  int i = 0;
                  givenAnswers.forEach((element) {
                    print(element.toLowerCase());
                    if (element.toLowerCase() ==
                        questions[i].correctAnswer.toLowerCase()) {
                      score++;
                      i++;
                    }
                  });
                  percentage = ((i * 100) / questions.length).toDouble();
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Score(
                              score: score,
                              percentage: percentage,
                              total: questions.length)));
                }
                setState(() {
                  currentQuestion++;
                });
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
  final Function setAnswer;
  Options(this.text, this.setAnswer);
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
            if (!isSelected) {
              widget.setAnswer(widget.text);
            }
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

class OneWord extends StatefulWidget {
  final String question;
  final Function setAnswers;
  final end;
  final int currentQuestion;
  final int totalQuestion;
  final key;
  OneWord(
      {this.question,
      this.setAnswers,
      this.currentQuestion,
      this.end,
      this.totalQuestion,
      this.key});
  @override
  _OneWordState createState() => _OneWordState();
}

class _OneWordState extends State<OneWord> {
  TextEditingController _textEditingController;
  String answer;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        '${(widget.end ?? 1) ~/ 60}:${(widget.end ?? 1) % 60}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 125.0),
                        child: Text(
                          'Question ${widget.currentQuestion}/${widget.totalQuestion}',
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
                    widget.question,
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
            child: Form(
              key: widget.key,
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Answer'),
                maxLines: 100,
                minLines: 100,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter a Answer";
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.setAnswers(value);
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class MCQ extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final end;
  final int currentQuestion;
  final int totalQuestion;
  final Function setAnswers;

  MCQ(
      {this.end,
      this.setAnswers,
      this.currentQuestion,
      this.question,
      this.totalQuestion,
      this.option1,
      this.option2,
      this.option3,
      this.option4});
  @override
  _MCQState createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      '${(widget.end ?? 1) ~/ 60}:${(widget.end ?? 1) % 60}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
                      child: Text(
                        'Question ${widget.currentQuestion}/${widget.totalQuestion}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 39),
                child: Text(
                  widget.question,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Options(widget.option1, widget.setAnswers),
        SizedBox(
          height: 9,
        ),
        Options(widget.option2, widget.setAnswers),
        SizedBox(
          height: 9,
        ),
        Options(widget.option3, widget.setAnswers),
        SizedBox(
          height: 9,
        ),
        Options(widget.option4, widget.setAnswers),
        SizedBox(
          height: 15,
        ),
      ],
    ));
  }
}

class TrueFalse extends StatefulWidget {
  final String question;
  final end;
  final int currentQuestion;
  final int totalQuestion;
  final Function setAnswers;
  TrueFalse(
      {this.question,
      this.currentQuestion,
      this.end,
      this.totalQuestion,
      this.setAnswers});
  @override
  _TrueFalseState createState() => _TrueFalseState();
}

class _TrueFalseState extends State<TrueFalse> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      '${(widget.end ?? 1) ~/ 60}:${(widget.end ?? 1) % 60}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 125.0),
                      child: Text(
                        'Question ${widget.currentQuestion}/${widget.totalQuestion}',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 39),
                child: Text(
                  widget.question,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Options('TRUE', widget.setAnswers),
        SizedBox(
          height: 9,
        ),
        Options('FALSE', widget.setAnswers),
        SizedBox(
          height: 9,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ));
  }
}
