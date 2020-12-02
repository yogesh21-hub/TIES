import 'package:flutter/material.dart';

class SetQuestionsScreen extends StatefulWidget {
  @override
  _SetQuestionsScreenState createState() => _SetQuestionsScreenState();
}

class _SetQuestionsScreenState extends State<SetQuestionsScreen> {
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 21,
          ),
          Container(
            height: 48,
            child: ListTile(
              trailing: Icon(Icons.search),
              title: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                  ),
                  alignLabelWithHint: true,
                  hintText: 'Enter the Keywords you are looking for',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          
           _questions(),
           _questions(),
           _questions(),
           _questions(),
           _questions(),
        ],
      ),
    );
  }
}

class _questions extends StatelessWidget {
  const _questions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
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
         
       ]),
       
        ),
    );
  }
}
