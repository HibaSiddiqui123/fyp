import 'package:flutter/material.dart';

class contact extends StatefulWidget {
  const contact({ Key? key }) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hello',style: TextStyle(fontSize: 30),),
    );
  }
}