import 'package:TIES/providers/question.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/widgets/question.dart';
import 'package:flutter/material.dart';

class SetQuestionsScreen extends StatefulWidget {
  String quizid;
  SetQuestionsScreen({this.quizid});
  @override
  _SetQuestionsScreenState createState() => _SetQuestionsScreenState();
}

class _SetQuestionsScreenState extends State<SetQuestionsScreen> {
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: QuizItem().getQuiz(widget.quizid),
      builder: (ctx, snapshot) {
        List<QuestionItem> questions = snapshot.data.questions;
        questions.forEach((element) {
          print(element.question);
        });
        return Column(
          children: [
            SizedBox(
              height: 21,
            ),
            Container(
              height: 48,
              child: ListTile(
                trailing: Icon(Icons.search),
                title: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    alignLabelWithHint: true,
                    hintText: 'Enter the Keywords you are looking for',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
      },
    );
  }
}
