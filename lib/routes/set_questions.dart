import 'package:TIES/dialogs/add_ques_dialog.dart';
import 'package:TIES/dialogs/teacher_profile_dialog.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/routes/create_question_screen.dart';
import 'package:TIES/routes/set_questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SetQuestions extends StatefulWidget {
  final String quizid;
  final String name;
  final date;
  SetQuestions({this.quizid, this.date, this.name});
  @override
  _SetQuestionsState createState() => _SetQuestionsState();
}

class _SetQuestionsState extends State<SetQuestions>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showButton = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showButton = true;
      } else {
        showButton = false;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd/MM/yyyy').format(widget.date);
    return Scaffold(
        appBar: AppBar(
          title: Text(' ${widget.name} Quiz 1 $date'),
          centerTitle: true,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xffFFF1F1).withOpacity(0.75),
              height: 46,
              width: double.infinity,
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 4,
                indicatorColor: Colors.red,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Set Questions',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'My Questions',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SetQuestionsScreen(quizid: widget.quizid),
                  CreateQuestionScreen(
                    quizId: widget.quizid,
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: showButton
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddQuesDialog(
                                quizid: widget.quizid,
                                date: date,
                                name: widget.name,
                              )));
                },
                child: Icon(Icons.add),
              )
            : null);
  }
}
