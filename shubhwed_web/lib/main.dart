import 'package:flutter/material.dart';
import 'test.dart';


//import 'package:shubhwed_web/test.dart';

import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  print(Uri.base.toString()); 
      //  print(Uri.base.query); 
        var data=Uri.parse(Uri.base.toString());
        print(data.queryParameters);
         print(data.path);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShubhWed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: generateRoute,
      //home: Scaffold(body: HomePage(Uri.base.query),backgroundColor:  Colors.red[50].withOpacity(0.2),),
    );
  }
}
Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => GetUserName(settings.name)) ;
}