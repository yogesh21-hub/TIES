import 'package:TIES/dialogs/subjectwise_stats_dialog.dart';
import 'package:flutter/material.dart';

class SubjectWiseStats extends StatefulWidget {
  @override
  _SubjectWiseStatsState createState() => _SubjectWiseStatsState();
}

class _SubjectWiseStatsState extends State<SubjectWiseStats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 52,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
          SizedBox(height: 33,),
          _subjectspecific(),
        SizedBox(height: 33,),
        
        ],
      ),
    );
  }
}

class _subjectspecific extends StatelessWidget {
  const _subjectspecific({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:14.0),
      child: Container(
        height: 72,
        color: Color(0xffD33030),
        child: ListTile(
          title: Text('Data Structures and Algorithms',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
          subtitle: Text('UCS-XXXX',style: TextStyle(fontSize: 11,color: Colors.white),),
          leading: Image.asset('assets/images/books.png'),
          trailing: Icon(Icons.arrow_right,color: Colors.white,size: 28,),
          onTap: () {
            showDialog(context: context,
            builder:(context){
              return SubjectWiseStatsDiallog();
            }
            );
          },
        ),
      ),
    );
  }
}