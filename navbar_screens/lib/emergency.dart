import 'package:flutter/material.dart';

class emegency extends StatefulWidget {
  const emegency({ Key? key }) : super(key: key);

  @override
  _emegencyState createState() => _emegencyState();
}

class _emegencyState extends State<emegency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text('Emergency Contact',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}