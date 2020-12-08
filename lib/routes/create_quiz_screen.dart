import 'package:TIES/providers/date_picker.dart';
import 'package:TIES/providers/modal_action_button.dart';
import 'package:flutter/material.dart';

class CreateQuizScreen extends StatefulWidget {
  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
      final _eventController = TextEditingController();
    final _descController = TextEditingController();
  void _saveEvent() {
    if (_eventController.text.isEmpty  ||_descController.text.isEmpty) {
      return;
    }
    }
    String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';
  Future _pickDate() async {
    DateTime datepick =await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(Duration(days: -365)),
      lastDate: new DateTime.now().add(Duration(days: 365)),);
      if (datepick!= null) setState(() {
        _selectedDate =datepick.toString();
      });
  }
  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now()
      );
      if(timepick!=null) setState(() {
        _selectedTime = timepick.format(context).toString();
      });
    print(_selectedTime);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
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
            SizedBox(height: 24,),

            TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12),
                ),
                ),
              labelText: 'Quiz Name',
            ),
            controller: _eventController,
          ),
              SizedBox(height: 12,),
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12),
                ),
                ),
              labelText: 'Topics',
            ),
            controller: _descController,
          ),
          SizedBox(height: 12,),
               TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12),
                ),
                ),
              labelText: 'Marks',
            ),
            controller: _descController,
          ),
              SizedBox(height: 12,),
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
              SizedBox(height: 24,),
               CustomModalActionButton(
                 onClose: () {
                  Navigator.of(context).pop();
                },
                onSave: () {
                  _saveEvent();
                },
              ),         
          ],
        ),
      ),
    );
  }
  }
  