

import 'package:flutter/material.dart';
import 'package:navbar_screens/ProfileDetails.dart';
import 'package:navbar_screens/Reports.dart';
import 'package:navbar_screens/contact.dart';
import 'package:navbar_screens/settings1.dart';

class setting extends StatelessWidget {

  final Padding=EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name='Hiba Siddiqui';
    final email='hiba123@abc.com';
    // final AssetImage='assets\womyn3.jpg';
    return Drawer(
       child: Material(
         color: Colors.pinkAccent,
         child: ListView(
           padding: Padding,
           children: <Widget>[
  
  buildHeader(
// assetImage: AssetImage,
  name:name,
  email:email,

),



             const SizedBox(height: 20,),
             buildmenuitem(
               
               text:'My Contacts',
               
               icon:Icons.contacts_outlined,
               onClicked: ()=>selecteditem(context, 0),

             ),
              const SizedBox(height: 15,),
             buildmenuitem(
               text:'Reports',
               icon:Icons.report_outlined,
                 onClicked: ()=>selecteditem(context, 1),
             ),
 const SizedBox(height: 15,),
             buildmenuitem(
               text:'Profile Details',
               icon:Icons.work_outline_rounded,
                 onClicked: ()=>selecteditem(context, 2),
             ),
              const SizedBox(height: 15,),
             buildmenuitem(
               text:'Settings',
               icon:Icons.settings_applications_outlined,
                 onClicked: ()=>selecteditem(context, 3),
             ),
             const SizedBox(height: 24,),
             Divider(color: Colors.white),
             const SizedBox(height: 24,) ,
             buildmenuitem(text: 'LOGOUT', icon: Icons.logout_sharp),
             
             


           ],
         ),
       ),
    );
  }

   
   
   Widget buildHeader({
// required AssetImage assetImage,
required String name,
required String email,

})=>InkWell(
  
  child:Container(
padding: Padding.add(EdgeInsets.symmetric(vertical: 40)),
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    CircleAvatar(radius: 50,backgroundImage: AssetImage('assets/womyn3.jpg'),
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
  Navigator.of(context).pop();
  switch(index){
    case 0:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contact(),));
 break;
 case 1:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Reports(),));
 break;
 case 2:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileDetails(),));
 break;
 case 3:
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>settings1(),));
 break;
  }
}
}