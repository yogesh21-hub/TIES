import 'package:TIES/routes/onboarding_1.dart';
import 'package:TIES/routes/profile_page.dart';
import 'package:TIES/services/auth.dart';
import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final _key = GlobalKey<FormState>();
  String useremail;
  String password;
  bool credentialTrue = true;
  TextEditingController _textEditingController;
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
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
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
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () async {
                  _key.currentState.save();
                  _key.currentState.validate();
                  dynamic user = await Authentication()
                      .signIn(email: useremail, password: password);
                      
                  if (user == null)
                    setState(() {
                      credentialTrue = false;
                    });
                    if(_key.currentState.validate())
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
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
              'Forgot Passsword',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 19),
            ),
            if (credentialTrue == false)
              Text(
                "Wrong username or password",
                style: TextStyle(color: Colors.red),
              )
          ],
        ),
      ),
    );
  }
}
