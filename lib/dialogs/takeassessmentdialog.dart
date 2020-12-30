import 'package:TIES/routes/take_assignment2.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class TakeAssessmentDialog extends StatefulWidget {
  final String quizid;
  final String correctOtp;
  TakeAssessmentDialog({this.correctOtp, this.quizid});
  @override
  _TakeAssessmentDialogState createState() => _TakeAssessmentDialogState();
}

class _TakeAssessmentDialogState extends State<TakeAssessmentDialog> {
  String otp;
  bool otpWrong = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        height: 342,
        width: 343,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 31,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Enter the One time Password for this Assessment',
                  style: TextStyle(
                    color: Color(0xffD33030),
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
              SizedBox(height: 41),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 36,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  otp = pin;
                },
              ),
              SizedBox(
                height: 10,
              ),
              if (otpWrong)
                Center(
                  child: Text(
                    'Entered OTP is wrong',
                    style: TextStyle(
                      color: Color(0xffD33030),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(
                height: 35,
              ),
              MaterialButton(
                height: 67,
                minWidth: double.infinity,
                onPressed: () {
                  if (otp == widget.correctOtp) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakeAssignment2(
                                  quizid: widget.quizid
                                )));
                  } else {
                    setState(() {
                      otpWrong = true;
                    });
                  }
                },
                color: Color(0xffD33030),
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
