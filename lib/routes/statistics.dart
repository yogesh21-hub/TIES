//import 'package:charts_flutter/flutter.dart';
import 'package:TIES/dialogs/profile_page_dialog.dart';
import 'package:TIES/routes/overallstats.dart';
import 'package:TIES/routes/profile_page.dart';
import 'package:TIES/routes/subjectwisestats.dart';
import 'package:flutter/material.dart';
class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics>  with SingleTickerProviderStateMixin{
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
      appBar: AppBar(
        title: Text('MY STATISTCIS'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context)=>ProfilePageDialog() 
            ));
          },
         icon: Icon(Icons.menu)),
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
            SizedBox(height: 10,),
            Container(
              height: 46,
              color: Color(0xffFFF1F1).withOpacity(0.75),
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 4,
                indicatorColor: Colors.red,
                tabs: [
                    Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Overall',
                              style: TextStyle(fontSize: 19,color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Subject Wise',
                              style: TextStyle(fontSize: 19,color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                          ),
                         
                ],

              ),
            ),
             Expanded(
                            child: TabBarView(
                            controller: _tabController,
                            children: [
                              OverallStats(),
                              SubjectWiseStats(),
                            ],
                          ),
             ),
          
          ],
        ),
      ),
      
    );
  }
}