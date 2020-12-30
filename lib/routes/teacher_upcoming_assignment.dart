import 'package:TIES/dialogs/teacher_assessment_pin_dialog.dart';
import 'package:TIES/dialogs/teacher_profile_dialog.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/routes/create_question_screen.dart';
import 'package:TIES/routes/create_quiz_screen.dart';
import 'package:TIES/routes/teacher_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'set_questions.dart';

class TeacherUpcomingAssignment extends StatefulWidget {
  @override
  _TeacherUpcomingAssignmentState createState() =>
      _TeacherUpcomingAssignmentState();
}

class _TeacherUpcomingAssignmentState extends State<TeacherUpcomingAssignment> {
  @override
  Widget build(BuildContext context) {
    List<QuizItem> items = Provider.of<List<QuizItem>>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('UPCOMING ASSESSMENTS'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TeacherProfileDialog()));
          },
        ),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.5, vertical: 20.5),
                child: _upcomingAssignments(
                  item: items[index],
                ),
              );
            },
            itemCount: items.length,
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: CreateQuizScreen(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          );
        },
        label: Text('Create Quiz'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class _upcomingAssignments extends StatefulWidget {
  final QuizItem item;
  const _upcomingAssignments({Key key, this.item}) : super(key: key);

  @override
  __upcomingAssignmentsState createState() => __upcomingAssignmentsState();
}

class __upcomingAssignmentsState extends State<_upcomingAssignments> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd-MMMM-yy').format(widget.item.date);
    var time = DateFormat('hh:mm aaa').format(widget.item.date);
    var nextTime = DateFormat('hh:mm aaa')
        .format(widget.item.date.add(Duration(minutes: widget.item.duration)));
    return AnimatedContainer(
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xffFFF1F1), boxShadow: [
                BoxShadow(
                  color: Color(0xff00000028),
                  blurRadius: 10,
                )
              ]),
              width: double.infinity,
              height: 262,
              child: isSelected
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 16),
                          child: Text('Topics: \n${widget.item.topics}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0, left: 16),
                          child: Text('Total Marks: ${widget.item.number}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 16),
                          child: Text('Time: $time - $nextTime'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 16),
                          child: Text('OTP: ${widget.item.otp}'),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 11,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            widget.item.name ?? 'Karamjeet Singh',
                            style: TextStyle(
                                color: Color(0xffFB2626),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            'Quiz 1  \n$format',
                            style: TextStyle(
                                color: Color(0xffFB2626),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            'Topics: ${widget.item.topics} \nMarks: ${widget.item.number}',
                            style: TextStyle(
                                color: Color(0xffFB2626),
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffFDBCBC), boxShadow: [
                BoxShadow(
                  color: Color(0xff00000028),
                  blurRadius: 10,
                  offset: Offset.fromDirection(10),
                ),
              ]),
              child: isSelected
                  ? MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetQuestions(
                                      quizid: widget.item.quizid,
                                      date: widget.item.date,
                                      name: widget.item.name,
                                    )));
                      },
                      child: Text(
                        'Set Questions',
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                    )
                  : Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            'by ${widget.item.uploadedBy}',
                            style: TextStyle(
                                color: Color(0xffFB2626),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(widget.item.date),
                            style: TextStyle(
                                color: Color(0xffFB2626),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
