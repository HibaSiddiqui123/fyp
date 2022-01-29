
import 'package:flutter/material.dart';


class phone extends StatefulWidget {
  const phone({ Key? key }) : super(key: key);

  @override
  _phoneState createState() => _phoneState();
}

class _phoneState extends State<phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('phone',style: TextStyle(fontSize: 30),),
    );
  }
}