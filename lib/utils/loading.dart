import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shubhwed/utils/constants.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPink,
      child: Center(
        child: SpinKitChasingDots(
          color: kDarkPink,
          size: 50.0,
        ),
      ),
    );
  }
}