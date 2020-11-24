import 'package:flutter/material.dart';

class SubjectDialog extends StatefulWidget {
  @override
  _SubjectDialogState createState() => _SubjectDialogState();
}

class _SubjectDialogState extends State<SubjectDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffFFFFFF),
      insetPadding: EdgeInsets.all(30),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
                iconSize: 24,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 71,
              color: Color(0xffFF0000).withOpacity(0.75),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Text(
                    'Data Structures and',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    'Algorithms',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 11.5,
            ),
            Center(
              child: Text(
                'UCS_XXXX',
                style: TextStyle(
                    color: Color(0xffD33030),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 27.5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 97.0),
                      child: Text(
                        'Quiz',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 131.0),
                      child: Text(
                        'Status',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Quiz 1 - 14/09/2020',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD33030)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Topics: CH 1 & 2',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        '[Total: 10 Marks]',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 73.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD33030)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Quiz 1 - 14/09/2020',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD33030)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Topics: CH 1 & 2',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        '[Total: 10 Marks]',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 73.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD33030)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Quiz 1 - 14/09/2020',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD33030)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Topics: CH 1 & 2',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        '[Total: 10 Marks]',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 73.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD33030)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Quiz 1 - 14/09/2020',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD33030)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        'Topics: CH 1 & 2',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Text(
                        '[Total: 10 Marks]',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff3D3C3C)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 73.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD33030)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 24.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Dialog(
                        backgroundColor: Color(0xffFFFFFF),
                        insetPadding: EdgeInsets.all(30),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.close),
                                  iconSize: 24,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 71,
                                color: Color(0xffFF0000).withOpacity(0.75),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Center(
                                        child: Text(
                                      'Data Structures and',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Center(
                                        child: Text(
                                      'Algorithms',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 11.5,
                              ),
                              Center(
                                child: Text(
                                  'UCS_XXXX',
                                  style: TextStyle(
                                      color: Color(0xffD33030),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 27.5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 97.0),
                                        child: Text(
                                          'Quiz',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 131.0),
                                        child: Text(
                                          'Status',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          'Quiz 1 - 14/09/2020',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffD33030)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          'Topics: CH 1 & 2',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff3D3C3C)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          '[Total: 10 Marks]',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff3D3C3C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 73.0),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffD33030)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          'Quiz 1 - 14/09/2020',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffD33030)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          'Topics: CH 1 & 2',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff3D3C3C)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Text(
                                          '[Total: 10 Marks]',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff3D3C3C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 73.0),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffD33030)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.0),
                                child: MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  height: 36,
                                  minWidth: 106,
                                  child: Text(
                                    'Go Back',
                                    style: TextStyle(color: Color(0xffFF0000)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                  }));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                height: 36,
                minWidth: 106,
                child: Text(
                  'View Scores',
                  style: TextStyle(color: Color(0xffFF0000)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
