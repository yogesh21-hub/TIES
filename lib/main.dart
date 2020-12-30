import 'package:TIES/providers/student_info.dart';
import 'package:TIES/providers/teacher_info.dart';
import 'package:TIES/routes/onboarding_1.dart';
import 'package:TIES/routes/profile_page.dart';
import 'package:TIES/routes/teacher_profile_page.dart';
import 'package:TIES/dialogs/teacher_subject_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:TIES/providers/quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<QuizItem>>.value(value: Quizes().getQuizes),
        Provider<StudentInfo>.value(value: StudentInfo()),
        Provider<TeacherInfo>.value(value: TeacherInfo()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return TeacherProfilePage();
              }
              return Onboarding1();
            },
          ),
          // home: FutureBuilder(
          //   future: _initialization,
          //   builder: (ctx, snapshot) {
          //     if (snapshot.hasError) {
          //       print(snapshot.error);
          //       return Scaffold(
          //         body: Text("Error"),
          //       );
          //     }

          //     if (snapshot.connectionState == ConnectionState.done)
          //       return LoginScreen();
          //     return Scaffold(
          //       body: Container(
          //         child: Text("Loading"),
          //       ),
          //     );
          //   },
          // ),
          routes: {
            //'/showdialog': (_) => TeacherSubjectDialog(),
          },
          title: "TIES",
          theme: ThemeData(
              primarySwatch: Colors.red, primaryColor: Colors.red[500])),
    );
  }
}
