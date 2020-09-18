import 'package:flutter/material.dart';

import 'package:TIES/providers/question.dart';

class QuizItem {
  final String quizid;
  final String name;
  final int number;
  final int duration;
  Questions questions;

  QuizItem(
      {this.duration, this.name, this.number, this.questions, this.quizid});
}

class Quizes with ChangeNotifier {
  List<QuizItem> _quizes = [];

  List<QuizItem> get quizes {
    return [..._quizes];
  }

  void addQuiz({QuizItem quiz}) {
    _quizes.add(quiz);
    notifyListeners();
  }

  void removeQuiz({String quizid}) {
    _quizes.removeWhere((element) {
      return element.quizid == quizid;
    });
    notifyListeners();
  }
}
