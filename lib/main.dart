import 'package:flutter/material.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/view/homepage.dart';

void main() {
  runApp(const MyApp());
  fetchdata();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: homepage(),

    );
  }
}
