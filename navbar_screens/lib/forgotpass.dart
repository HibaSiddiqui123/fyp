import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/login.dart';
import 'package:navbar_screens/signin.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: ForgotPass(),
//     );
//   }
// }

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController emailcontroller = TextEditingController();

  Reset() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailcontroller.text);
    if (emailValid) {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text)
          .then((value) {
            var snackBar = SnackBar(
          content: Text("Email Sent"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => loginUser()),
                        (route) => false);
          })
          .onError((error, stackTrace) {
        var snackBar = SnackBar(
          content: Text("Invalid Credentials"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontroller,
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
                onPressed: Reset,
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => loginUser()),
                        (route) => false);
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage(),));
                  },
                  child: Text(
                    'Back to Login',
                    style: TextStyle(fontSize: 20, color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
