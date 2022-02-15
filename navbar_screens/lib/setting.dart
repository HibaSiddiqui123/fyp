import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/ProfileDetails.dart';
import 'package:navbar_screens/contact.dart';
import 'package:navbar_screens/login.dart';
import 'package:navbar_screens/main.dart';
import 'package:navbar_screens/settings1.dart';
import 'package:navbar_screens/terms_and_conditions.dart';

import 'privacy_policy.dart';

class setting extends StatefulWidget {
 

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  final Padding=EdgeInsets.symmetric(horizontal: 20);
  final firebaseInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var image = "";
  @override
  void initState() {
    // Only create the stream once
    firebaseInstance.collection('users').doc(auth.currentUser!.uid).get().then((value) {
      setState(() {
        image = value['image'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name= FirebaseAuth.instance.currentUser!.displayName;
    
    final email = FirebaseAuth.instance.currentUser!.email;
    //final email='hiba123@abc.com';
    // String? name = FirebaseAuth.instance.currentUser!.displayName;
    // final AssetImage='assets\womyn3.jpg';
    return Drawer(
       child: Material(
         color: Colors.pinkAccent,
         child: ListView(
           padding: Padding,
           children: <Widget>[
  
  buildHeader(
// assetImage: AssetImage,
  name : name.toString(),
  email: email.toString(),
  image: image
),



             const SizedBox(height: 20,),
             buildmenuitem(
               
               text:'Emergency Contacts',
               
               icon:Icons.contacts_outlined,
               onClicked: ()=>selecteditem(context, 0),

             ),
              const SizedBox(height: 15,),
             buildmenuitem(
               text:'Profile Details',
               icon:Icons.work_outline_rounded,
                 onClicked: ()=>selecteditem(context, 1),
             ),                            
             const SizedBox(height: 15,),
             buildmenuitem(
               text:'Terms And Conditions',
               icon:Icons.report_outlined,
                 onClicked: ()=>selecteditem(context, 2),
             ),
              const SizedBox(height: 15,),
             buildmenuitem(
               text:'Privacy Policy',
               icon:Icons.privacy_tip_rounded,
                 onClicked: ()=>selecteditem(context, 4),
             ),
             const SizedBox(height: 24,),
             Divider(color: Colors.white),
             const SizedBox(height: 24,) ,
             buildmenuitem(text: 'LOGOUT', icon: Icons.logout_sharp,
             onClicked: () async {
              await FirebaseAuth.instance.signOut();
              selecteditem(context, 3);
             } 
             ),
             
             


           ],
         ),
       ),
    );
  }

   Widget buildHeader({
// required AssetImage assetImage,
required String name,
required String email,
required String image,
})=>InkWell(
  
  child:Container(
padding: Padding.add(EdgeInsets.symmetric(vertical: 40)),
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    CircleAvatar(radius: 50,backgroundImage: image == "" ? AssetImage('assets/womyn3.jpg') as ImageProvider : NetworkImage(image),
    ),SizedBox(width: 20,),
  Text(name,style: TextStyle(fontSize: 20,color: Colors.white),
  ),
  const SizedBox(height: 4,),
  Text(email,style: TextStyle(fontSize: 15,color: Colors.white,),),
const SizedBox(height: 10,),
Divider(color: Colors.white,)
  
  ],

),

  ) ,
);

  Widget buildmenuitem({
required String text,
required IconData icon,
VoidCallback? onClicked,
})
{
  final Color=Colors.white;
  final hovercolor=Colors.white70;
  return ListTile(
leading: Icon(icon,color: Color,),
title: Text(text,style: TextStyle(color: Color),),
hoverColor: hovercolor,
onTap: onClicked,
  );
}

void selecteditem(BuildContext context, int index){
  // Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homescreen()));
  switch(index){
    case 0:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contact(),));
 break;
 case 1:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileDetails(),));
 break;
 case 2:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Terms_And_Conditions(),));
 break;
 case 4:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicy(),));
 break;
 case 3:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginUser(),));
 break;
  }
}
}