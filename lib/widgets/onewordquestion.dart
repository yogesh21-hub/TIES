// import 'package:TIES/providers/question.dart';
// import 'package:flutter/material.dart';

// class OneWord extends StatefulWidget {
//   @override
//   _OneWordState createState() => _OneWordState();
//   final addQuestion;
//   OneWord(this.addQuestion);
// }

// class _OneWordState extends State<OneWord> {
//   String question;
//   String correctAnswer;
//   final _key = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _key,
//         child: Column(children: <Widget>[
//           TextFormField(
//             onSaved: (value) => question = value,
//             textInputAction: TextInputAction.newline,
//             maxLines: 3,
//             decoration: InputDecoration(
//                 labelText: "Question", labelStyle: TextStyle(fontSize: 18)),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             onSaved: (value) => question = value,
//             textInputAction: TextInputAction.newline,
//             maxLines: 2,
//             decoration: InputDecoration(
//                 labelText: "Correct Answer",
//                 labelStyle: TextStyle(fontSize: 18)),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: RaisedButton(
//               color: Colors.blue,
//               onPressed: () {
//                 _key.currentState.save();
//                 if (_key.currentState.validate()) {
//                   widget.addQuestion(QuestionItem(
//                       question: question,
//                       correctAnswer: correctAnswer,
//                       answers: [],
//                       questionid: DateTime.now().toIso8601String()));
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Text(
//                   "Add Question",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w300,
//                       fontSize: 25),
//                 ),
//               ),
//             ),
//           )
//         ]));
//   }
// }
