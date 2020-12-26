import 'package:flutter/material.dart';


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
    return ClipRRect(
         borderRadius: BorderRadius.circular(width*0.009),
          child: Container(
        padding: EdgeInsets.all(width*0.01),
        width: width * 0.2,
        height: width*0.2,
        color: Colors.orange[100].withOpacity(0.2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                input,
                color: Colors.orangeAccent,
                size: width * 0.11,
              ),
              Text(
                '$msg',
                style: TextStyle(
                  fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
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
      ),
    );
  }
}
