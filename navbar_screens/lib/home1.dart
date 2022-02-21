import 'dart:async';
import 'package:navbar_screens/sharedprefrences.dart';
import 'package:vibration/vibration.dart';
import 'package:navbar_screens/notification_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'package:background_sms/background_sms.dart';
import 'package:background_location/background_location.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'contact.dart';

class home1 extends StatefulWidget {
  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {
  bool serviceState = false;
  late bool _serviceEnabled;
  late LocationData _locationData;
  bool panicState = false;
  int panicCount = 0;
  int? _volumeListenerId;
  String contact = "";
  final TextEditingController latText = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance;
  Timer? timer;
  List<String> lst = [];
  int sec = 0;
  Position? getposition;

  _getPermission() async => await [
        Permission.sms,
      ].request();

  Future<bool> _isPermissionGranted() async =>
      await Permission.sms.status.isGranted;

  _sendMessage(String phoneNumber, String message) async {
    var result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }

  Future<bool> get _supportCustomSim async =>
      await BackgroundSms.isSupportCustomSim;

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

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => home1()));

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
_getPermission();
    listenNotifications();
    firebaseInstance
        .collection('Contacts')
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .listen((value) {
      lst = [];
      for (var i = 0; i < value.docs.length; i++) {
        lst.add(value.docs[i].data()['Phone Number']);
      }
      setState(() {
        contact = lst.join(';');
        print(contact);
      });
    });
    // StreamSubscription<Position> positionStream =
    //     Geolocator.getPositionStream(locationSettings: locationSettings)
    //         .listen((Position? position) {
    //   setState(() {
    //     getposition = position;
    //   });
    // });

    _volumeListenerId = VolumeWatcher.addListener((volume) async {
      if (serviceState) {
        setState(() {
          panicCount++;
          print(panicCount);
        });
      }
    });
    print(serviceState);
    if (mounted) {
      timer = Timer.periodic(Duration(seconds: 3), (Timer t) async {
        if (serviceState) {
          sec = sec + 3;
          if (panicCount >= 3) {
            setState(() {
              BackgroundLocation.startLocationService();
              panicState = !panicState;
              sec = 0;
              panicCount = 0;
              if (panicState) {
                NotificationApi.showNotification(
                    title: 'Panic State Activated!',
                    body: 'Your location will be sent after every 3mins');
                print("Panic State Activated!");
                notificatons('Panic State Activated!',
                    'Your location will be sent after every 3mins');
              } else {
                NotificationApi.showNotification(
                    title: 'Panic State Deactivated!',
                    body: 'Panic state has been deactivated successfully!');
                print("Panic State Deactivated!");
                notificatons('Panic State Deactivated!',
                    'Panic state has been deactivated successfully!');
                    BackgroundLocation.stopLocationService();
              }
              Vibration.vibrate();
            });
          } else {
            panicCount = 0;
            if (panicState) {
              if (sec == 15) {
                print("Reached Message");
                sec = 0;
                String lng = "";
                String lat = "";
                BackgroundLocation.getLocationUpdates((location) {
                  print(location.latitude);
                  lng = location.longitude.toString();
                  lat = location.latitude.toString();
                });
                Uri myuri = Uri.parse(
                    "https://www.google.com/maps/search/?api=1&query=${lat},${lng}");
                print(myuri.toString());
                
                print("Sending SMS to : ${contact}");
                for (int i = 0; i < lst.length; i++) {
                  _sendMessage(
                      lst[i],
                      "Help ${auth.currentUser!.displayName} at " +
                          myuri.toString());
                }
              }

              setState(() {
                panicCount = 0;
                print(
                    "Counter Reset for normal process, ${panicCount}, ${sec}");
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
    BackgroundLocation.stopLocationService();
    super.dispose();

    // be sure to cancel on dispose
  }

  String swipeText = "Swipe To Activate";
  String name = FirebaseAuth.instance.currentUser?.displayName ?? "User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(55.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SliderButton(
              action: () async {
                // _serviceEnabled = await location.serviceEnabled();
                // if (!_serviceEnabled) {
                //   _serviceEnabled = await location.requestService();
                //   if (!_serviceEnabled) {
                //     return;
                //   }
                // }

                await BackgroundLocation.startLocationService();
                if (await _isPermissionGranted()) {
                  setState(() {
                    if (lst.length == 0) {
                      var snackBar = SnackBar(
                        content: Text("Add Emergency Contacts First!"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      serviceState = true;
                      print("Service Enabled!");
                    }
                  });
                } else
                  _getPermission();

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
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
