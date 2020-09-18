import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question.dart';

class CreateQuestionScreen extends StatefulWidget {
  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();

  final String name;
  final int number;
  final int duration;
  CreateQuestionScreen(this.name, this.number, this.duration);
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final questionClass = Questions();
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} Quiz${widget.number}"),
        actions: <Widget>[IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            leading: Text("Q${index + 1}"),
          );
        },
        itemCount: questionClass.questions.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-question', arguments: {
            "number": questionClass.questions.length + 1,
            "addQuestion": questionClass.addQuestion
          });
        },
        child: Icon(Icons.add),
        tooltip: "Add Question",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
