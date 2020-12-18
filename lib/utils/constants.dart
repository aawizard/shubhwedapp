import 'package:flutter/material.dart';

Color kPink = Color(0xffFF5861);
Color kGrey = Color(0xffE5E5E5);
Color kDarkPink =Color(0xffee3e83);
Color kSkin = Color(0xffffddcc);

List<Color> kBgGradient = [
  kDarkPink,
  kSkin,
];

final InputDecoration decoration = new InputDecoration(
  focusedBorder: new OutlineInputBorder(
    borderSide: BorderSide(color: kPink),
  ),
  labelStyle: TextStyle(color: Colors.black),
  hintText: "Name",
  labelText: "Name",
);