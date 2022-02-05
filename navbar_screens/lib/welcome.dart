import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navbar_screens/Register.dart';

import 'signin.dart';
import 'signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  //const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,

        /*Padding(
       padding: const EdgeInsets.only(bottom: 20,left: 25),
       child: Text('By continuing you agree to Terms and Conditions'),
     ),*/
        resizeToAvoidBottomInset: false,
        body: Container(
          //width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal:2),

          color: Colors.white,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 80.w,
                    height: 90.h,
                    child: //Image.network('https://i.etsystatic.com/7673973/r/il/64bd6a/2996029273/il_570xN.2996029273_tbtq.jpg'),)
                        Image.asset('assets/logo3.png'),
                  ),
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 15),
                    child: const Text(
                      "Women Safer",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.pinkAccent,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 0, top: 25),
                    child: Image.asset('assets/womyn2.jpg',
                        width: 150.w, height: 200.h),
                  ),
                ]),

                // ignore: avoid_unnecessary_containers

                SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                            //splashColor: Colors.red,
                            elevation: 7,
                            color: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              //side: BorderSide(color: Colors.red,width: 2),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.grey,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ]),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LoginPage()),
                              // );
                            })),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Container(
                    width: 300,
                    height: 50,
                    child: RaisedButton(
                        //  splashColor: Colors.red,
                        elevation: 7,
                        color: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //side: BorderSide(color: Colors.red,width: 2),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ]),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterUser()));
                        })),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child:
                        Text('By continuing you agree to Terms and Conditions'),
                  ),
                ),
                SizedBox(
                  height: 8,
                )
              ]),

          //hhhhhhh//
        ));
  }
}
