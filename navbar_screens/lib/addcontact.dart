
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:navbar_screens/home1.dart';
import 'package:navbar_screens/main.dart';
import 'splash1.dart';
import 'welcome.dart';
class Addcontacts extends StatelessWidget {
  GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey();
 final _usernameController =TextEditingController(); 
 final _phonenumberController =TextEditingController();
 final _relationController =TextEditingController();
   GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
   
   void add() async {
   FirebaseFirestore db = FirebaseFirestore.instance;
   var response =  db.collection("Contacts").add({
        "Username": _usernameController.text,
        "Phone Number": _phonenumberController.text,
        "Relation": _relationController.text,
        "user_id": FirebaseAuth.instance.currentUser?.uid,
   });

   _usernameController.clear();
   _phonenumberController.clear();
   _relationController.clear();
   }
  void validation(){
if(_usernameController.text.trim().isEmpty || _usernameController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "user Name is empty"
    ))
  );
  return;
}

if(_phonenumberController.text.trim().isEmpty || _phonenumberController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "phonenumber is empty"
    ))
  );
  return;
}


if(_relationController.text.trim().isEmpty || _relationController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "Relation is empty"
    ))
  );
  return;
}}
 Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
           
           hintText: hintText,
           hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18),
           fillColor:Colors.pink[200],
           filled: true,
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(color: Colors.white,width:1.0),
            
             //borderRadius: BorderRadius.circular(20)
           ),
           focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,width:1.0),
            // borderRadius: BorderRadius.circular(20)
           )
         ),
       ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       extendBodyBehindAppBar: true,
      appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.pinkAccent,
              elevation: 0.0,
              title: Center(
                child: Row(
                  children: [
                    SizedBox(width: 55.0),
                    Text(
                      "Add Emergency Contact",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
       body: SafeArea(
         child: Container(
             //width: double.infinity,
             
        
         child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             
            children:[
         
         SizedBox(height:80),
          Text("Add Contacts",style: TextStyle(fontSize: 32,color: Colors.grey[700],fontWeight:FontWeight.bold),),
         
          
        
               Center(
                 child: Column(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                     
                      
                     children: [
                      SizedBox(height:45),
                       textfield(hintText: "Name",
                    
                       
                       obscureText: false, controller: _usernameController,
                     
                       ),
                        SizedBox(height:20),
                       textfield(hintText: "Phone#",
                       
                       obscureText: false, controller: _phonenumberController,
                     
                       ),
                      
                       SizedBox(height:20),
                       textfield(hintText: "Relation",
                      
                       obscureText: false, controller: _relationController,
                      
                       ),
                        SizedBox(height:20),//SizedBox(height:1),
                       Container(
                         width: 300,
                 height: 50,
                        child: RaisedButton(
                            //splashColor: Colors.red,
                 elevation: 7,
                   color: Colors.grey[300],
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                     //side: BorderSide(color: Colors.red,width: 2),
                     
                     ),
                     child: Text("Submit",style: TextStyle(fontSize: 17,color: Colors.pinkAccent,fontWeight:FontWeight.bold,shadows: [
                    Shadow(
                        blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0,2.0),
                        ),
                 ]),),
                           onPressed: () async {
                             add();
                           var snackBar = SnackBar(
          content: Text("Contact Added!"),
          action: SnackBarAction(
            label: "Close",
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);          
            //  validation();
           }

                           ),
                           ),
                           SizedBox(height:30),

                     ],
                    
                   ),
               ),
            ])
            
             ),
           ),
         
            
         );
        
  }
}

