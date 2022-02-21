// import 'package:get/get.dart';
// import 'package:navbar_screens/main.dart';
// import 'dart:async';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';

// import 'login.dart';

// class sharedPrefrences{

//   // late int state;
//   // int _state = 0;
 
//   setInstance(_state)async{
//     final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
//     _sharedPreferences.setInt('state', _state);
//   }

//   getInstance()async{
//     final SharedPreferences _sharedprefrences = await SharedPreferences.getInstance();
//     int ? state = _sharedprefrences.getInt('state');
//     if (state == 1){
//       print("if");
//       return Timer(Duration(seconds: 2),() => Get.to(homescreen()));
//     }
//     else{
//       print('else');
//       return state == 0;
//     }
//   }

  
// }
