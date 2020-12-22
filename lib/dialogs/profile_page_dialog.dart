import 'package:TIES/routes/onboarding_1.dart';
import 'package:TIES/routes/previous_assignments.dart';
import 'package:TIES/routes/profile_page.dart';
import 'package:TIES/routes/reset_password.dart';
import 'package:TIES/routes/statistics.dart';
import 'package:TIES/routes/take_assignment.dart';
import 'package:TIES/routes/upcoming_assignements.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD33030),
      bottomNavigationBar: MaterialButton(
        height: 60,
        minWidth: double.infinity,
        color: Colors.white,
        onPressed: () {
          FirebaseAuth.instance.signOut();

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Onboarding1()));
        },
        child: Text(
          'Log out',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Text(
              'Thapar',
              style: TextStyle(fontSize: 45, color: Colors.white),
            )),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              'Intelligent Evaluation System',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
            SizedBox(
              height: 50,
            ),
               ListTile(
              title: Center(
                  child: Text(
                'Take Assessment',
                style: TextStyle(fontSize: 19, color: Colors.white),
              )),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TakeAssignment()));
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'My Courses',
                style: TextStyle(fontSize: 19, color: Colors.white),
              )),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'Upcoming Assessments',
                style: TextStyle(fontSize: 19, color: Colors.white),
              )),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpcomingAssigments()));
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'Previous Assessments',
                style: TextStyle(fontSize: 19, color: Colors.white),
              )),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PreviousAssignments()));
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'My Statistics',
                style: TextStyle(fontSize: 19, color: Colors.white),
              )),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Statistics()));
              },
            ),
            ListTile(
              title: Center(
                  child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
