import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in with email and password
  Future signIn({String email, String password}) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user.uid;
    } catch (e) {
      if (e.code == "wrong-password") return "Wrong password";
      return "User doesn't exist";
    }
  }

  //auth changes
  // Future authlistener()async{

  // }
  //sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
