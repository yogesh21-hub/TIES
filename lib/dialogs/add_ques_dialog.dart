import 'package:flutter/material.dart';

class AddQuesDialog extends StatefulWidget {
  @override
  _AddQuesDialogState createState() => _AddQuesDialogState();
}

class _AddQuesDialogState extends State<AddQuesDialog> {
  TextEditingController _textEditingController;
  bool aVal = false;
  bool bVal = false;
  bool cVal = false;
  bool dVal = false;
  var _formkey = GlobalKey<FormState>();
  var _optionkey1 = GlobalKey<FormState>();
  var _optionkey2 = GlobalKey<FormState>();
  var _optionkey3 = GlobalKey<FormState>();
  var _optionkey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Color(0xffFFFFFF),
        insetPadding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    iconSize: 24,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 71,
                  color: Color(0xffFF0000).withOpacity(0.75),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                          child: Text(
                        'Data Structures and',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        'Algorithms',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        'UCS_XXXX',
                        style: TextStyle(
                            color: Color(0xffD33030),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Text(
                        '20/09/2020',
                        style: TextStyle(
                            color: Color(0xffD33030),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                        alignLabelWithHint: true,
                        hintText: 'Enter Question',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value.isEmpty) return 'Enter a Question';
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Multiple Choice'),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        'Add Image (if required)',
                        style:
                            TextStyle(fontSize: 17, color: Color(0xffAFAFAF)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: MaterialButton(
                        height: 36,
                        minWidth: 145,
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Insert Image',
                          style:
                              TextStyle(color: Color(0xffFF0000), fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SetOptions('Option A', _optionkey1),
                    SetOptions('Option B', _optionkey2),
                  ],
                ),
                Row(
                  children: [
                    SetOptions('Option C', _optionkey3),
                    SetOptions('Option D', _optionkey4),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        'Correct Answer:',
                        style:
                            TextStyle(color: Color(0xff3D3C3C), fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("A"),
                          Checkbox(
                            value: aVal,
                            onChanged: (bool value) {
                              setState(() {
                                aVal = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("B"),
                        Checkbox(
                          value: bVal,
                          onChanged: (bool value) {
                            setState(() {
                              bVal = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("C"),
                        Checkbox(
                          value: cVal,
                          onChanged: (bool value) {
                            setState(() {
                              cVal = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("D"),
                        Checkbox(
                          value: dVal,
                          onChanged: (bool value) {
                            setState(() {
                              dVal = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 71,
                  onPressed: () {
                    _formkey.currentState.validate();
                    _optionkey1.currentState.validate();
                    _optionkey2.currentState.validate();
                    _optionkey3.currentState.validate();
                    _optionkey4.currentState.validate();
                  },
                  color: Color(0xffFF0000).withOpacity(0.75),
                  child: Text(
                    'CONFIRM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SetOptions extends StatefulWidget {
  String text;
  var _optionkey;
  SetOptions(this.text, this._optionkey);
  @override
  _SetOptionsState createState() => _SetOptionsState();
}

class _SetOptionsState extends State<SetOptions> {
  TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Form(
        key: widget._optionkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: _textEditingController,
            validator: (value) {
              if (value.isEmpty) return "Option Required";
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
              alignLabelWithHint: true,
              hintText: widget.text,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
