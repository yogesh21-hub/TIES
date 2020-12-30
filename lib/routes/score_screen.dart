import 'package:TIES/routes/profile_page.dart';
import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  final int score;
  final double percentage;
  final int total;
  Score({this.percentage, this.score, this.total});
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2 - 20,
              color: Color(0xffFF0000).withOpacity(0.75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Your Score is:',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              '${widget.score}/${widget.total}',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                '${widget.percentage}%',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 225,
            ),
            MaterialButton(
              height: 55,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Color(0xffFF0000),
              child: Text(
                'Tap to Continue',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
