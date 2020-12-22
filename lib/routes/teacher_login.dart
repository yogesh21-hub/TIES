import 'package:flutter/material.dart';
class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              child: Column(
                children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Email-Id',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 20,),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red,
                      child: IconButton(
              
              onPressed: () {
                
              },
              icon: Icon(Icons.arrow_forward),
              iconSize: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 55,),
          Text('Forgot Passsword',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 19),),
        ],),
      
   
    );
  }
}