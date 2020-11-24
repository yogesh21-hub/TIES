import 'package:TIES/routes/teacher_profile_dialog.dart';
import 'package:TIES/routes/teacher_subject_dialog.dart';
import 'package:flutter/material.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31,
              ),
              Container(
                color: Color(0xffAFAFAF).withOpacity(0.40),
                height: 104,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        'Shreelekha Pandey',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        'TIET, Patiala',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        'CSED',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'My Courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 43),
              )),
              SizedBox(
                height: 11,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _courses extends StatelessWidget {
  const _courses({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.5),
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return TeacherSubjectDialog();
                      });
                },
                child: Container(
                  child: Image.asset('assets/images/books.png'),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD33030).withOpacity(0.7),
                  ),
                  height: 122,
                  width: 122,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.5),
              child: Text(
                'UCS_XXXX',
                style: TextStyle(color: Color(0xffFF0000), fontSize: 17),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.5),
              child: MaterialButton(
                onPressed: () {
                  
                },
                child: Container(

                  child: Image.asset('assets/images/books.png'),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD33030).withOpacity(0.7),
                  ),
                  height: 122,
                  width: 122,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.5),
              child: Text(
                'UCS_XXXX',
                style: TextStyle(color: Color(0xffFF0000), fontSize: 17),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
    