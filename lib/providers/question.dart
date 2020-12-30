import 'package:flutter/cupertino.dart';

class QuestionItem {
  final String question;
  List answers;
  final String correctAnswer;
  final String difficulty;
  final String type;

  QuestionItem(
      {this.answers,
      this.correctAnswer,
      this.question,
      this.difficulty,
      this.type});
}

class Questions with ChangeNotifier {}
