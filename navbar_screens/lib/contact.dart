import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/addcontact.dart';
import 'package:navbar_screens/contactmodel.dart';

class contact extends StatefulWidget {
  const contact({ Key? key }) : super(key: key);

  @override
  _contactState createState() => _contactState();
}
class _contactState extends State<contact> {

Location location = new Location();
late bool _serviceEnabled;
late PermissionStatus _permissonGranted;
late LocationData _locationData;
bool _isListenLocation = false, _isGetLocation = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()async{
                    _serviceEnabled  = await location.serviceEnabled();
                    if(!_serviceEnabled){
                      _serviceEnabled = await location.requestService();
                      if(_serviceEnabled)return;
                    }
                    _permissonGranted = await location.hasPermission();
                    if(_permissonGranted == PermissionStatus.denied){
                      _permissonGranted = await location.requestPermission();
                      if(_permissonGranted != PermissionStatus.granted)return;
                    }
                    _locationData = await location.getLocation();
                    setState(() {
                      _isGetLocation = true;
                    });
                }, child: const Text("Get"),),
                SizedBox(height: 10,),
                _isGetLocation  ? Text("Location: ${_locationData.latitude} / ${_locationData.longitude}"): Container(),
                SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{
                _serviceEnabled  = await location.serviceEnabled();
                    if(!_serviceEnabled){
                      _serviceEnabled = await location.requestService();
                      if(_serviceEnabled)return;
                    }
                    _permissonGranted = await location.hasPermission();
                    if(_permissonGranted == PermissionStatus.denied){
                      _permissonGranted = await location.requestPermission();
                      if(_permissonGranted != PermissionStatus.granted)return;
                    }
                    setState(() {
                      _isListenLocation = true;
                    });
              }, child: Text("Get Live Location")),
              SizedBox(height: 10,),
              StreamBuilder(
                stream: location.onLocationChanged,
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.waiting){
                    var data = snapshot.data as LocationData;
                    return Text("Location: \n ${data.latitude}/${data.longitude}");
                  }
                  else return Center(child: CircularProgressIndicator(),);
                }) 
              ]),
      ),
    );
  }
}