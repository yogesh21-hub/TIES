import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz.dart';

class TeacherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<QuizItem> quizes = Provider.of<Quizes>(context).quizes;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIES",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            child: Text("Q"),
          );
        },
        itemCount: quizes.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Create a Quiz",
        onPressed: () {
          Navigator.of(context).pushNamed('/create-quiz');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
