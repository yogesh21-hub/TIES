import 'package:TIES/dialogs/profile_page_dialog.dart';
import 'package:TIES/dialogs/takeassessmentdialog.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/routes/take_assignment2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TakeAssignment extends StatefulWidget {
  @override
  _TakeAssignmentState createState() => _TakeAssignmentState();
}

class _TakeAssignmentState extends State<TakeAssignment> {
  @override
  Widget build(BuildContext context) {
    List<QuizItem> items = Provider.of<List<QuizItem>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Assessment'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => ProfilePageDialog()));
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
                child: _TakeAssignmentWidget(
                  item: items[index],
                ),
              );
            },
            itemCount: items.length,
          )),
    );
  }
}

class _TakeAssignmentWidget extends StatefulWidget {
  final QuizItem item;
  _TakeAssignmentWidget({this.item});
  @override
  __TakeAssignmentWidgetState createState() => __TakeAssignmentWidgetState();
}

class __TakeAssignmentWidgetState extends State<_TakeAssignmentWidget> {
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
              decoration: BoxDecoration(
                  color: isSelected ? Color(0xffFDBCBC) : Color(0xffFFF1F1),
                  boxShadow: [
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
                          child: Text('Room: LT 402'),
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
                            widget.item.name ?? "UCS742",
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
                            'Quiz 1 - \n$format',
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
              decoration: BoxDecoration(
                  color: isSelected ? Color(0xffFFF1F1) : Color(0xffFDBCBC),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000028),
                      blurRadius: 10,
                      offset: Offset.fromDirection(10),
                    ),
                  ]),
              child: isSelected
                  ? MaterialButton(
                      onPressed: () {
                        if (DateTime.now()
                                    .difference(widget.item.date)
                                    .inSeconds <=
                                60
                            //TODO:implement deactivate link
                            // DateTime.now()
                            //         .difference(widget.item.date)
                            //         .inSeconds >=
                            //     0
                            ) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return TakeAssessmentDialog(
                                  correctOtp: widget.item.otp,
                                  quizid: widget.item.quizid,
                                );
                              });
                        }
                      },
                      child: Center(
                        child: Text(
                          'Take the assessment',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
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
