import 'package:flutter/material.dart';
import 'package:untitled/model/waterModel.dart';
import 'package:untitled/pages/CardScreen.dart';

class Detailedpage extends StatelessWidget {
  final Watermodel property ;
  final DateTime id ;
  const Detailedpage({super.key,  required this.property, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text("Detailed page")),
        body: Column(
          children: [
         CardScreen(watermodel: property , isDetails: false, ) ,
          ],


    ),


    );
  }
}
