import 'package:TIES/providers/student_info.dart';
import 'package:TIES/routes/profile_page.dart';
import 'package:TIES/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final _key = GlobalKey<FormState>();
  String useremail;
  String password;
  String user = " ";
  bool credentialTrue;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    credentialTrue = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                key: ValueKey('email'),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Enter an Email address';
                  else if (!value.contains('@'))
                    return 'Please enter a valid email address';
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: _textEditingController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email-Id',
                ),
                onSaved: (value) {
                  useremail = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value.isEmpty) return "Enter a Password";
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Password',
                ),
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
              ),
            ),
            if (credentialTrue == false)
              Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                margin: EdgeInsets.only(right: 256),
                child: Text(
                  user,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.left,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () async {
                  _key.currentState.save();
                  bool answer = _key.currentState.validate();
                  if (answer) {
                    user = await Authentication()
                        .signIn(email: useremail, password: password);

                    if (user == "Wrong password" ||
                        user == "User doesn't exist") {
                      setState(() {
                        credentialTrue = false;
                      });
                    } else {
                      StudentInfo student =
                          Provider.of<StudentInfo>(context, listen: false);
                      await student.setCredentials(user);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    }
                  }
                },
                icon: Icon(Icons.arrow_forward),
                iconSize: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
