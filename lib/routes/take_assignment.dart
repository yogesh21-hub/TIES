import 'package:TIES/dialogs/profile_page_dialog.dart';
import 'package:TIES/dialogs/takeassessmentdialog.dart';
import 'package:TIES/routes/take_assignment2.dart';
import 'package:flutter/material.dart';

class TakeAssignment extends StatefulWidget {

  @override
  _TakeAssignmentState createState() => _TakeAssignmentState();
}

class _TakeAssignmentState extends State<TakeAssignment> {
  bool isSelected =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Assessment'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {

          },
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
          
          children: [
            SizedBox(
                    height: 31,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.5),
              child: AnimatedContainer(
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
                                  padding: const EdgeInsets.only(top:20.0,left: 16),
                                  child: Text('Topics: Chapters 1 and 2'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 16),
                                  child: Text('Details:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:22.0,left: 16),
                                  child: Text('Total Marks: 10'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 16),
                                  child: Text('Time: 5:30 PM - 6:00 PM'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 16),
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
                                    'UCS-XXXX',
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
                                    'Quiz 1 - Data Structures \nand Algorithms \n14/09/2020',
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
                                    'Topics: Chapters 1 and 2 \nMarks: 10',
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
                              showDialog(
                                context: context,
                                builder: (context){
                                  return TakeAssessmentDialog();
                                }
                                );
                            },
                            child: Center(
                              child: Text('Take the assessment',style: TextStyle(color: Colors.red,fontSize: 20),),
                            ),
                          )
                               
                              
                          : Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 17.0),
                                  child: Text(
                                    'by Shreelekha Pandey',
                                    style: TextStyle(
                                        color: Color(0xffFB2626),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32.0),
                                  child: Text(
                                    '10/09/2020',
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
    ),
            ),
          ],
        ),
      ),
    );
  }
}