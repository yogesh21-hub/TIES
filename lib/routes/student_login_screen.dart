import 'package:TIES/routes/onboarding_1.dart';
import 'package:TIES/routes/student_login.dart';
import 'package:TIES/routes/teacher_login.dart';
import 'package:flutter/material.dart';

class StudentLoginScreen extends StatefulWidget {
  @override
  _StudentLoginScreenState createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/b2.png'), fit: BoxFit.cover),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 343,
                color: Color(0xffFF0000).withOpacity(0.75),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 36),
                      child: IconButton(
                        iconSize: 31.67,
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onboarding1(),
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 54,
                    ),
                    Center(
                        child: Text(
                      'Thapar',
                      style: TextStyle(color: Colors.white, fontSize: 45),
                    )),
                    Center(
                        child: Text(
                      'Intelligent Evaluation System',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )),
                    SizedBox(
                      height: 73,
                    ),
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Student',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Teacher',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Student(),
                    Teacher(),
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
