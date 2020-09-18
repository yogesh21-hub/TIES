import 'package:flutter/cupertino.dart';

class QuestionItem {
  final String questionid;
  final String question;
  final List<String> answers;
  final String correctAnswer;

  QuestionItem(
      {this.answers, this.correctAnswer, this.question, this.questionid});
}

class Questions with ChangeNotifier {
  final List<QuestionItem> _questions = [];

  List<QuestionItem> get questions {
    return [..._questions];
  }

  void addQuestion(QuestionItem question) {
    _questions.add(question);
    notifyListeners();
  }

  void removeQuestion(String questionid) {
    _questions.removeWhere((element) => element.questionid == questionid);
    notifyListeners();
  }
}
