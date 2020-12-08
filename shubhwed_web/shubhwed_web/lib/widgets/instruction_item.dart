import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class InstructionItem extends StatelessWidget {
  IconData input;
  String msg;
  String msgDescription;
  double width;
  double height;
  InstructionItem(
      this.input, this.msg, this.msgDescription, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      height: width * 0.7 * 0.28,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              input,
              color: Colors.blue,
              size: width * 0.11,
            ),
            Text(
              '$msg',
              style: TextStyle(
                fontSize: (18 / 720) * MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              '$msgDescription',
              style: TextStyle(
                fontSize: (8 / 720) * MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
