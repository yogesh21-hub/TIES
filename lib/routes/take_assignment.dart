import 'package:TIES/routes/profile_page_dialog.dart';
import 'package:TIES/routes/take_assignment2.dart';
import 'package:flutter/material.dart';

class TakeAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Assessment'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePageDialog()));
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
        child: Column(
          children: [
            SizedBox(
              height: 31,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.5),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakeAssignment2()));
                },
                child: Container(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.5),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakeAssignment2()));
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Color(0xffFDBCBC), boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000028),
                      blurRadius: 10,
                      offset: Offset.fromDirection(10),
                    ),
                  ]),
                  child: Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
