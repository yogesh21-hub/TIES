import 'package:TIES/dialogs/add_ques_dialog.dart';
import 'package:TIES/dialogs/teacher_profile_dialog.dart';
import 'package:TIES/routes/create_question_screen.dart';
import 'package:TIES/routes/set_questions_screen.dart';
import 'package:flutter/material.dart';

class SetQuestions extends StatefulWidget {
  @override
  _SetQuestionsState createState() => _SetQuestionsState();
}

class _SetQuestionsState extends State<SetQuestions>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showButton = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showButton = true;
      } else {
        showButton = false;
      }
    
    setState(() {});
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UCS-XXXX Quiz 2 20/09/2020'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TeacherProfileDialog(),
                ));
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
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: Color(0xffFFF1F1).withOpacity(0.75),
            height: 46,
            width: double.infinity,
            child: TabBar(
              controller: _tabController,
              indicatorWeight: 4,
              indicatorColor: Colors.red,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Set Questions',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'My Questions',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SetQuestionsScreen(),
                CreateQuestionScreen(),
              ],
            ),
          ),
        ]),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: showButton? FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddQuesDialog()));
          
        },
        
        child: Icon(Icons.add),
      ):null
    );
  }
}
