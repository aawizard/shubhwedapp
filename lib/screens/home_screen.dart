import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';

class homeScreen extends DrawerContent {
  static const String id = 'home_screen';
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
//    fetchUserDetailsFromSharedPref();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }}
