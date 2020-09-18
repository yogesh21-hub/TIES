import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './routes/login_screen.dart';
import './routes/student_login_screen.dart';
import './routes/teacher_login_screen.dart';
import './routes/teacher_home_screen.dart';
import './routes/create_quiz_screen.dart';
import 'package:TIES/providers/quiz.dart';
import './routes/add_question_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Quizes()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: _initialization,
            builder: (ctx, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Scaffold(
                  body: Text("Error"),
                );
              }

              if (snapshot.connectionState == ConnectionState.done)
                return LoginScreen();
              return Scaffold(
                body: Container(
                  child: Text("Loading"),
                ),
              );
            },
          ),
          routes: {
            '/student-login': (_) => StudentLoginScreen(),
            '/teacher-login': (_) => TeacherLoginScreen(),
            '/teacher-home': (_) => TeacherHomeScreen(),
            '/create-quiz': (_) => CreateQuizScreen(),
            '/add-question': (_) => AddQuestionScreen(),
          },
          title: "TIES",
          theme: ThemeData(
              primarySwatch: Colors.red, primaryColor: Colors.red[500])),
    );
  }
}
