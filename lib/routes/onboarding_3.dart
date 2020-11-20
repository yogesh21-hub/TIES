import 'package:TIES/routes/student_login_screen.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/b2.png'), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 343,
              width: double.infinity,
              color: Color(0xffFF0000).withOpacity(.75),
              child: Column(
                children: [
                  SizedBox(
                    height: 97,
                  ),
                  Center(
                      child: Text(
                    'Discover',
                    style: TextStyle(color: Colors.white, fontSize: 43),
                  )),
                  SizedBox(
                    height: 21,
                  ),
                  Center(
                      child: Text(
                    'A new, revamped approach to ',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  )),
                  Center(
                    child: Text(
                      'Evaluation and Assessment.',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  Center(
                    child: Text(
                      'For Thapar, by Thapar.',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 89,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 85,
                  color: Color(0xffFF0000).withOpacity(.75),
                ),
                Center(child: Image.asset('assets/images/tab.png')),
              ],
            ),

            //SizedBox(height: MediaQuery.of(context).size.height-434,),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: MaterialButton(
                height: 53,
                minWidth: 359,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Lets Start',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentLoginScreen()));
                },
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/b2.png'), fit: BoxFit.cover),
      ),
      child: Column(children: [
        Container(
          height: 343,
          width: double.infinity,
          color: Color(0xffFF0000).withOpacity(.75),
          child: Column(
            children: [
              SizedBox(
                height: 97,
              ),
              Center(
                  child: Text(
                'Evaluate',
                style: TextStyle(color: Colors.white, fontSize: 43),
              )),
              SizedBox(
                height: 21,
              ),
              Center(
                  child: Text(
                'Your performance with your peers.',
                style: TextStyle(color: Colors.white, fontSize: 19),
              )),
              Center(
                child: Text(
                  'Use Graphical representations to see overall ,',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              Center(
                child: Text(
                  'performances class averages, and more.',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              SizedBox(
                height: 89,
              ),
            ],
          ),
        ),

        // SizedBox(height: MediaQuery.of(context).size.height-434,),
        Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: MaterialButton(
            height: 53,
            minWidth: 359,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Lets Start',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentLoginScreen()));
            },
            color: Colors.red,
          ),
        ),
      ]),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/b2.png'), fit: BoxFit.cover),
      ),
      child: Column(children: [
        Container(
          height: 343,
          width: double.infinity,
          color: Color(0xffFF0000).withOpacity(.75),
          child: Column(
            children: [
              SizedBox(
                height: 97,
              ),
              Center(
                  child: Text(
                'Discover',
                style: TextStyle(color: Colors.white, fontSize: 43),
              )),
              SizedBox(
                height: 21,
              ),
              Center(
                  child: Text(
                'A new, revamped approach to ',
                style: TextStyle(color: Colors.white, fontSize: 19),
              )),
              Center(
                child: Text(
                  'Evaluation and Assessment.',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              Center(
                child: Text(
                  'For Thapar, by Thapar.',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              SizedBox(
                height: 89,
              ),
            ],
          ),
        ),

        //SizedBox(height: MediaQuery.of(context).size.height-434,),
        Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: MaterialButton(
            height: 53,
            minWidth: 359,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Lets Start',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentLoginScreen()));
            },
            color: Colors.red,
          ),
        ),
      ]),
    );
  }
}
