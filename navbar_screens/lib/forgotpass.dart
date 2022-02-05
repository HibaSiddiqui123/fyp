import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:navbar_screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ForgotPass(),
    );
  }
}

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: AppBar(
              toolbarHeight: 150,
              leading: Center(
                  child: Image(
                image: AssetImage(
                  'logo3.png',
                ),
              )),
              leadingWidth: 100,
              backgroundColor: Colors.white,
              elevation: 5,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30.0),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Women Safer',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: (Image(
                              image: AssetImage('womyn5.jpg'),
                              width: 150,
                            )),
                          )
//
                        ])),
              ))),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            TextFormField(
              cursorColor: Colors.pinkAccent,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent)),
                labelText: "Email",
                hintText: "Enter your email",
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.pinkAccent,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('SUBMIT'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 20),
                  primary: Colors.pinkAccent,
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            TextButton(
                onPressed: () {
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage(),));
                },
                child: Text(
                  'Back to Login',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
