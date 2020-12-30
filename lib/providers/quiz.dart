import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TIES/providers/question.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';

class QuizItem {
  String quizid;
  final String topics;
  final String name;
  final String uploadedBy;
  final int number;
  final int duration;
  String otp;
  List<QuestionItem> questions;
  final DateTime date;

  QuizItem(
      {this.duration,
      this.name,
      this.number,
      this.topics,
      this.date,
      this.uploadedBy,
      this.questions,
      this.quizid,
      this.otp});

  Future<void> uploadQuiz() async {
    otp = randomNumeric(6);
    try {
      DocumentReference x =
          await FirebaseFirestore.instance.collection("quizes").add({
        'name': name,
        'topics': topics,
        'marks': number,
        'duration': duration,
        'date': date,
        'questions': <Map<String, dynamic>>[],
        'uploadedBy': uploadedBy,
        'otp': otp
      });
      print(x.id);
    } catch (e) {
      print(e.toString());
    }
  }

  QuizItem _convertSnapshotToQuiz(DocumentSnapshot snapshot) {
    QuizItem item = QuizItem(
      name: snapshot.data()['name'],
      date: DateTime.fromMicrosecondsSinceEpoch(
          (snapshot.data()['date'] as Timestamp).microsecondsSinceEpoch),
      topics: snapshot.data()['topics'],
      duration: snapshot.data()['duration'],
      number: snapshot.data()['marks'],
      uploadedBy: snapshot.data()['uploadedBy'],
    );
    List questions = snapshot.data()['questions'];

    item.questions = questions.map((value) {
      return QuestionItem(
          question: value['question'],
          correctAnswer: value['correctAnswer'],
          difficulty: value['difficulty'],
          type: value['type'],
          answers: value['answers']);
    }).toList();
    return item;
  }

  Future<QuizItem> getQuizItem(String id) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("quizes").doc(id).get();
    return _convertSnapshotToQuiz(snapshot);
  }

  Stream<QuizItem> getQuiz(String id) {
    return FirebaseFirestore.instance
        .collection("quizes")
        .doc(id)
        .snapshots()
        .map(_convertSnapshotToQuiz);
  }

  Future<void> uploadQuestion(String quizid, QuestionItem question) async {
    try {
      DocumentSnapshot quiz = await FirebaseFirestore.instance
          .collection("quizes")
          .doc(quizid)
          .get();
      List questions = quiz.data()['questions'];
      questions.add({
        'question': question.question,
        'answers': question.answers,
        'correctAnswer': question.correctAnswer,
        'difficulty': question.difficulty,
        'type': question.type
      });
      await FirebaseFirestore.instance
          .collection("quizes")
          .doc(quizid)
          .update({'questions': questions});
    } catch (e) {
      print(e.toString());
    }
  }
}

class Quizes {
  List<QuizItem> _convertSnapshottoquizes(QuerySnapshot snapshot) {
    return snapshot.docs.map((value) {
      return QuizItem(
          date: DateTime.fromMicrosecondsSinceEpoch(
              (value.data()['date'] as Timestamp).microsecondsSinceEpoch),
          name: value.data()['name'],
          topics: value.data()['topics'],
          duration: value.data()['duration'],
          number: value.data()['marks'],
          uploadedBy: value.data()['uploadedBy'],
          quizid: value.id,
          otp: value.data()['otp']);
    }).toList();
  }

  Stream<List<QuizItem>> get getQuizes {
    return FirebaseFirestore.instance
        .collection("quizes")
        .snapshots()
        .map(_convertSnapshottoquizes);
  }
}
