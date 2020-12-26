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
        color: Colors.transparent,
        child: Text(
          '${widget.msg}',
          style: TextStyle(
              fontSize: (10/ 720) * MediaQuery.of(context).size.width, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
