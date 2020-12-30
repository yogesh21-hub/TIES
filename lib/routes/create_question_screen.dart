import 'package:TIES/providers/question.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQuestionScreen extends StatefulWidget {
  final String quizId;
  CreateQuestionScreen({this.quizId});
  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: QuizItem().getQuiz(widget.quizId),
        builder: (ctx, snapshot) {
          List<QuestionItem> questions = snapshot.data.questions;
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Question(
                      difficulty: questions[index].difficulty,
                      question: questions[index].question,
                      type: questions[index].type,
                    );
                  },
                  itemCount: questions.length,
                ),
              )
            ],
          );
        });
  }
}
