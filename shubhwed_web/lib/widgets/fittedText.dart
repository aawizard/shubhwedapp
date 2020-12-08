import 'package:flutter/material.dart';

class FittedText extends StatefulWidget {
  String msg;
  double h;
  double w;
  FittedText(this.msg);
  @override
  _FittedTextState createState() => _FittedTextState();
}

class _FittedTextState extends State<FittedText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
    
        child: Text(
          '${widget.msg}',
          style: TextStyle(
              fontSize: (16/ 720) * MediaQuery.of(context).size.width, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
