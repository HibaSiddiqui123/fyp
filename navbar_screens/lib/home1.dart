// @dart=2.9
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'contact.dart';

class home1 extends StatefulWidget {
  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {

  String  username = "";
  String name = FirebaseAuth.instance.currentUser?.displayName ?? "User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(      
        children: [
          Padding(
            padding: const EdgeInsets.all(55.0),
            child: Text(name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SliderButton(
              action: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contact(),));
                // getLocation();
    //             setState(() {
    // _isGetLocation = true;
    //                        });
    // _isGetLocation ? Text("Location: ${_locationData.latitude}/ ${_locationData.longitude}"): Container();
//functionality
              },
              label: Text(
                "Swipe to Activate!",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.pinkAccent,
                size: 40.0,
              ),
              baseColor: Colors.black,
              highlightedColor: Colors.yellow,
              backgroundColor: Colors.pinkAccent),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
                "assets/pink-shield.svg",
                height: 300,
              ),
          ),
          Text(
            '"Happiness has many roots, but none more important than SECURITY..!"',
            style: TextStyle(
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}