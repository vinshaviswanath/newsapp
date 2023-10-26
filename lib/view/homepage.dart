import 'package:flutter/material.dart';
import 'package:newsapp/model/model.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});
  

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(children:  [
      Text((responsedata?.articles?[1].title).toString(),),]),
    );
  }
}

