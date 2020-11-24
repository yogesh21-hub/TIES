import 'package:TIES/routes/teacher_profile_dialog.dart';
import 'package:flutter/material.dart';

class TeacherUpcomingAssignment extends StatefulWidget {
  @override
  _TeacherUpcomingAssignmentState createState() => _TeacherUpcomingAssignmentState();
}

class _TeacherUpcomingAssignmentState extends State<TeacherUpcomingAssignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('UPCOMING ASSESSMENTS'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherProfileDialog()));
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.5),
                child: MaterialButton(
                  onPressed: () {
                   
                  },
                  child: _upcomingAssignments(),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.5),
                child: MaterialButton(
                  onPressed: () {
                   
                  },
                  child: _upcomingAssignments(),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.5),
                child: MaterialButton(
                  onPressed: () {
                   
                  },
                  child: _upcomingAssignments(),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.5),
                child: MaterialButton(
                  onPressed: () {
                   
                  },
                  child: _upcomingAssignments()
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.5),
                child: MaterialButton(
                  onPressed: () {
                   
                  },
                  child: _upcomingAssignments()
                ),
              ),
              SizedBox(
                height: 31,
              ),
              
          ],),
        ),
    ));
  }
}

class _upcomingAssignments extends StatelessWidget {
  const _upcomingAssignments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Color(0xffFFF1F1), boxShadow: [
        BoxShadow(
          color: Color(0xff00000028),
          blurRadius: 10,
        )
      ]),
      width: double.infinity,
      height: 262,
      child: Column(
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
    );
  }

  }
