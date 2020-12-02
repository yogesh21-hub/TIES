import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question.dart';

class CreateQuestionScreen extends StatefulWidget {
  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 52,
        ),
        Container(
          height: 116,
          width: double.infinity,
          color: Color(0xffD33030),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Image.asset(
                'assets/images/books.png',
                height: 37,
                width: 22,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 33, left: 22.0),
                  child: Text(
                    'Question: \nAHJHABDBSAJBDKAJBKNADBNSBMBMSD',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    'Difficulty: 2',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Colors.white,
            )
          ]),
          
        ),
       
      ],
    );
  }
}
