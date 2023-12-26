import 'package:flutter/material.dart';

class Hompage extends StatefulWidget{
  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal,
      body: Column(
        children: [
          Center(child: Text("Heelooooo",style: TextStyle(fontSize: 30,color: Colors.pink),)),
        ],
      ),
    );
  }
}