import 'dart:async';
import 'package:vibration/vibration.dart';
import 'package:navbar_screens/notification_api.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:telephony/telephony.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'contact.dart';

class home1 extends StatefulWidget {
  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {
  bool serviceState = false;
  bool panicState = false;
  int panicCount = 0;
  int? _volumeListenerId;
  String contact = "";
  final TextEditingController latText = TextEditingController(); 
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Telephony telephony = Telephony.instance;
  final firebaseInstance =  FirebaseFirestore.instance;
  Timer? timer;
  List<String> lst = [];
  int sec = 0;
  Position? getposition;
  final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
  );

  notificatons(String title, String message) {
    try {
      FirebaseFirestore.instance.collection("notifications").add({
        'title': title,
        'message': message,
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'created on': DateTime.now().millisecondsSinceEpoch,
        
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }


void listenNotifications() => NotificationApi.onNotifications.stream.listen(onClickedNotification);
void onClickedNotification(String? payload) => 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => home1()));

@override
void initState() {
  super.initState();
  NotificationApi.init();
  listenNotifications();
  firebaseInstance.collection('Contacts').where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots().listen((value) {
      lst = [];
      for (var i = 0; i < value.docs.length; i++) {
        lst.add(value.docs[i].data()['Phone Number']);
      }
      setState(() {
        contact = lst.join(';');
        print(contact);
      });
  });
  StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
        setState((){
          getposition = position;
        });
  });
          
  _volumeListenerId = VolumeWatcher.addListener((volume) async {
    if(serviceState)
    {
      setState(() {
        panicCount++;
        print(panicCount);  
      });
    }
  });
  print(serviceState);
  if(mounted)
  {  
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) async {
      if(serviceState)
      {
        sec = sec + 3;
        if(panicCount >= 3)
        {
          setState(() {
            panicState = !panicState;
            sec = 0;
            panicCount = 0;
            if(panicState)
            {
              NotificationApi.showNotification(
                                title: 'Panic State Activated!',
                                body: 'Your location will be sent after every 3mins'
                              );
              print("Panic State Activated!");
              notificatons('Panic State Activated!', 'Your location will be sent after every 3mins');
            }
            else
            {
              NotificationApi.showNotification(
                                title: 'Panic State Deactivated!',
                                body: 'Panic state has been deactivated successfully!'
                              );
              print("Panic State Deactivated!");
              notificatons('Panic State Deactivated!', 'Panic state has been deactivated successfully!');
            }
            Vibration.vibrate();
          });
        }
        else
        {
          panicCount = 0;
          if(panicState)
          {
            if(sec == 15)
            {
              print("Reached Message");
              sec = 0;
              var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); 
              String lng = pos.longitude.toString();
              String lat = pos.latitude.toString();
              Uri myuri = Uri.parse("https://www.google.com/maps/search/?api=1&query=${lat},${lng}");
              print(myuri.toString());
              print("Sending SMS to : ${contact}");
              for(int i = 0; i < lst.length ; i++)
              {
                Telephony.backgroundInstance.sendSms(
                  to: lst[i],
                  message: "Help ${auth.currentUser!.displayName} at " + myuri.toString(),
                  statusListener: (status) {
                  print("status = $status to ${lst[i]}");
                  } 
                );
              }
            }
          
            setState(() {
              panicCount = 0;
              print("Counter Reset for normal process, ${panicCount}, ${sec}");
            });
          }
        }
      }
    });
    
  }
}

@override
void dispose() {
  timer?.cancel();
  //VolumeWatcher.removeListener(_volumeListenerId);
  super.dispose();
  
  // be sure to cancel on dispose
}

Future<void> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  //return await Geolocator.getCurrentPosition();
}
  String  swipeText = "Swipe To Activate";
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
              action: () async {
                bool? permissionsGranted = await telephony.requestSmsPermissions;
                setState(() {
                  _determinePosition();
                  serviceState = true;
                  print("Service Enabled!");
                });
                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contact(),));
                //functionality
              },
              label: Text(
                swipeText,
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
              backgroundColor: Colors.pinkAccent) ,
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
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}