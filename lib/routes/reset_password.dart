import 'package:TIES/dialogs/profile_page_dialog.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _textEditingController;
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESET PASSWORD'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePageDialog()));
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
            children: [
              SizedBox(
                height: 203,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'Current Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'New Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xffFF0000),
                radius: 35,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 42,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 227,
                              width: 363,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 34,
                                  ),
                                  Center(
                                      child: Text(
                                    'PASSWORD RESET ',
                                    style: TextStyle(
                                        color: Color(0xffD33030), fontSize: 25),
                                  )),
                                  Center(
                                      child: Text(
                                    'SUCCESSFUL',
                                    style: TextStyle(
                                        color: Color(0xffD33030), fontSize: 25),
                                  )),
                                  SizedBox(
                                    height: 68,
                                  ),
                                  MaterialButton(
                                    color: Color(0xffD33030),
                                    minWidth: 343,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    height: 67,
                                    child: Text(
                                      'Go Back',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
