import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final String difficulty;
  final String type;
  Question({this.difficulty, this.question, this.type});
  @override
  Widget build(BuildContext context) {
    String x = question;
    String y = "";
    if (x.length > 50) {
      y = "\n" + x.substring(50);
      x = x.substring(0, 50);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Container(
        height: 120,
        width: double.infinity,
        color: Color(0xffD33030),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
                padding: const EdgeInsets.only(top: 20, left: 20.0),
                child: Text(
                  'Question: \n$x$y',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  overflow: TextOverflow.fade,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Difficulty: $difficulty',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Type: $type',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
