import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';

class giftListScreen extends DrawerContent {
  @override
  _giftListScreenState createState() => _giftListScreenState();
}

class _giftListScreenState extends State<giftListScreen> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    Future<bool> _onBackPress() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MainWidget()));
    }
    return WillPopScope(
        onWillPop: _onBackPress,
        child: Scaffold(
          body: Center(
            child: Text("Gift screen"),
          )
        ));
  }
}
