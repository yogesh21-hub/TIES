import 'package:TIES/dialogs/profile_page_dialog.dart';
import 'package:flutter/material.dart';

class PreviousAssignments extends StatefulWidget {
  @override
  _PreviousAssignmentsState createState() => _PreviousAssignmentsState();
}

class _PreviousAssignmentsState extends State<PreviousAssignments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('PREVIOUS ASSESSMENTS'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePageDialog()));
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 31,
                ),
                _previousAssesments(),
              ],
            ),
          ),
        ));
  }
}

class _previousAssesments extends StatefulWidget {
  const _previousAssesments({
    Key key,
  }) : super(key: key);

  @override
  __previousAssesmentsState createState() => __previousAssesmentsState();
}

class __previousAssesmentsState extends State<_previousAssesments> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.5),
      child: AnimatedContainer(
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
                            child: Text('Topics: Chapters 1 and 2'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 16),
                            child: Text('Details:'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0, left: 16),
                            child: Text('Total Marks: 10'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 16),
                            child: Text('Marks Scored: 8'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 16),
                            child: Text('Time: 5:30 PM - 6:00 PM'),
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
                        decoration:
                            BoxDecoration(color:isSelected ? Color(0xffFFF1F1) : Color(0xffFDBCBC), boxShadow: [
                          BoxShadow(
                            color: Color(0xff00000028),
                            blurRadius: 10,
                            offset: Offset.fromDirection(10),
                          ),
                        ]),
                        child: isSelected?null: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 17.0),
                              child: Text(
                                'by Karamjeet Singh',
                                style: TextStyle(
                                    color: Color(0xffFB2626),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
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
    );
  }
}
