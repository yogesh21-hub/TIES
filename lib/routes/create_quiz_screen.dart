import 'package:TIES/providers/date_picker.dart';
import 'package:TIES/providers/modal_action_button.dart';
import 'package:TIES/providers/quiz.dart';
import 'package:TIES/providers/teacher_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQuizScreen extends StatefulWidget {
  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final _eventController = TextEditingController();
  final _descController = TextEditingController();
  final _durationController = TextEditingController();
  final _marksController = TextEditingController();

  final _key = GlobalKey<FormState>();
  String quizName;
  String topics;
  int marks;
  int duration;
  DateTime date = DateTime.now();

  String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';
  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(Duration(days: -365)),
      lastDate: new DateTime.now().add(Duration(days: 365)),
    );
    if (datepick != null) date = datepick;
  }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timepick != null)
      date = date.add(Duration(hours: timepick.hour, minutes: timepick.minute));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                'Create New Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                //TODO: implement validator
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: 'Quiz Name',
                ),
                controller: _eventController,
                onSaved: (val) {
                  quizName = val;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: 'Topics',
                ),
                controller: _descController,
                onSaved: (val) {
                  topics = val;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: 'Marks',
                ),
                controller: _marksController,
                onSaved: (val) {
                  marks = int.parse(val);
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: 'Duration (in mins)',
                ),
                controller: _durationController,
                onSaved: (val) {
                  duration = int.parse(val);
                },
              ),
              SizedBox(
                height: 12,
              ),
              CustomDateTimePicker(
                icon: Icons.date_range,
                onPressed: _pickDate,
                value: _selectedDate,
              ),
              CustomDateTimePicker(
                icon: Icons.access_time,
                onPressed: _pickTime,
                value: _selectedTime,
              ),
              SizedBox(
                height: 24,
              ),
              CustomModalActionButton(
                onClose: () {
                  Navigator.of(context).pop();
                },
                onSave: () {
                  //save and validate
                  _key.currentState.save();
                  bool x = _key.currentState.validate();
                  if (x) {
                    String uploadedBy =
                        Provider.of<TeacherInfo>(context, listen: false).name;
                    QuizItem item = QuizItem(
                        duration: duration,
                        name: quizName,
                        number: marks,
                        topics: topics,
                        date: date,
                        uploadedBy: uploadedBy);
                    item.uploadQuiz().then((_) => Navigator.of(context).pop());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
