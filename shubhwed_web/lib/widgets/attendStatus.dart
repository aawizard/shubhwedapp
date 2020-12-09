import 'package:flutter/material.dart';

class AttendStatus extends StatefulWidget {
  @override
  _AttendStatusState createState() => _AttendStatusState();
}

class _AttendStatusState extends State<AttendStatus> {
    int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                'Yes.I\'ll be there in person',
                style: TextStyle(
                    fontSize: (12 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10,),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                   new Text(
                'No,I can\'t attend',
                style: TextStyle(
                    fontSize: (12 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
                    new Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                   new Text(
                'I\'m not sure',
                style: TextStyle(
                    fontSize: (12 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
                  ],
                );
  }
}