import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'welcome.dart';

class Splash3 extends StatefulWidget {
  const Splash3({ Key? key }) : super(key: key);

  @override
  _Splash3State createState() => _Splash3State();
}

class _Splash3State extends State<Splash3> {

  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Welcome())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.pink[200],
        body: Container(
      //width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal:2),

      color: Colors.white,

      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 100.w,
            height: 120.h,
            child: //Image.network('https://i.etsystatic.com/7673973/r/il/64bd6a/2996029273/il_570xN.2996029273_tbtq.jpg'),)
                Image.asset('assets/logo3.png'),
            //  Image.network('https://media.istockphoto.com/vectors/abstract-red-circle-background-vector-id637375362?k=20&m=637375362&s=612x612&w=0&h=dtGyNsEGB-FbaPIINPCu8th-kO2rNJIkou4T2_YA3S0='),
          ),
        ),
        SizedBox(height: 12.h),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Center(
                        child: RichText(text: const TextSpan(
                          text: "Women Safer\n",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.pinkAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,                  
                          ),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: RichText(text: const TextSpan(
                        text: "Set your default Sim in your mobile phone from which you want to send emergency message and do emergency calls! ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,                  
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
                
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
            child: Image.asset(
          'assets/sims.png',
          width: MediaQuery.of(context).size.width*0.4,
          height: MediaQuery.of(context).size.height*0.25,
        )),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Image.asset('assets/wmyn1.jpg', width: 270.w, height: 290.h),
        ))
      ]),
    ));
  }
}