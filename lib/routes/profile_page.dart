import 'package:TIES/routes/onboarding_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Color(0xffD33030),
                    insetPadding: EdgeInsets.all(1),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                              child: Text(
                            'Thapar',
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                              child: Text(
                            'Intelligent Evaluation System',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                              child: Text(
                            'Take Assignment',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            'Take Assignment',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            'Take Assignment',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            'Take Assignment',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            'Take Assignment',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 563,
                          ),
                          MaterialButton(
                            height: 60,
                            minWidth: double.infinity,
                            color: Colors.white,
                            onPressed: () {
                              FirebaseAuth.instance.signOut();

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Onboarding1()));
                            },
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31,
              ),
              Container(
                color: Color(0xffAFAFAF),
                height: 104,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        'Pratyaksh Verma',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        'TIET, Patiala',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62.0),
                      child: Text(
                        '4CO18',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'My Courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 43),
              )),
              SizedBox(
                height: 11,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
              _courses(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _courses extends StatelessWidget {
  const _courses({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.5),
              child: MaterialButton(
                onPressed: () {
                   showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Color(0xffFFFFFF),
                    insetPadding: EdgeInsets.all(30),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close),
                              iconSize: 24,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 71,
                            color: Color(0xffFF0000).withOpacity(0.75),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Center(child: Text('Data Structures and',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
                               Center(child: Text('Algorithms',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),))
                            ],),
                          ),
                          SizedBox(height: 11.5,),
                          Center(child: Text('UCS_XXXX',style: TextStyle(color: Color(0xffD33030),fontSize: 25,fontWeight: FontWeight.bold),),),
                          SizedBox(height: 27.5,),
                         Column(children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:97.0),
                                    child: Text('Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:131.0),
                                    child: Text('Status',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 17,),
                              
                              
                            ],),
                          Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:38.0),
                                    child: Text('Quiz 1 - 14/09/2020',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xffD33030)),),
                                    
                                  )
                                ],),
                        ],
                      ),
                    ),
                  );
              
              });
                },
                  child: Container(
                  child: Image.asset('assets/images/books.png'),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD33030).withOpacity(0.7),
                  ),
                  height: 122,
                  width: 122,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.5),
              child: Text(
                'UCS_XXXX',
                style:
                    TextStyle(color: Color(0xffFF0000), fontSize: 17),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.5),
              child: MaterialButton(
                onPressed: () {},
                  child: Container(
                  child: Image.asset('assets/images/books.png'),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD33030).withOpacity(0.7),
                  ),
                  height: 122,
                  width: 122,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.5),
              child: Text(
                'UCS_XXXX',
                style:
                    TextStyle(color: Color(0xffFF0000), fontSize: 17),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
