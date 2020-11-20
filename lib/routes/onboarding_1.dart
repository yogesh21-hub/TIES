import 'package:TIES/routes/onboarding_2.dart';
import 'package:TIES/routes/student_login_screen.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 115),
              child: Image.asset(
                'assets/images/tietlogo.png',
                height: 179,
                width: 126,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Thapar',
              style: TextStyle(fontSize: 45, color: Color(0xffFF0000)),
            ),
            Text(
              'Intelligent Evaluation System',
              style: TextStyle(fontSize: 30, color: Color(0xff3D3C3C)),
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              color: Color(0xffFF0000),
              minWidth: 359,
              height: 53,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'ABOUT',
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Onboarding2()));
              },
            ),
            SizedBox(
              height: 11,
            ),
            MaterialButton(
              color: Color(0xffFF0000),
              minWidth: 359,
              height: 53,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'TAP TO CONTINUE',
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentLoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
