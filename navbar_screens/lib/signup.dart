import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'signin.dart';
import 'splash1.dart';
import 'welcome.dart';
class Signup extends StatelessWidget {
  //
  //const Patient({ Key? key }) : super(key: key);
   final _usernameController =TextEditingController();
  
  final _emailController =TextEditingController();
  final _phonenumberController =TextEditingController();
  final _passController =TextEditingController();
  
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<bool> registerUser(String username,String phonenumber, String email, String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
AuthResult result =await _auth.createUserWithEmailAndPassword(email:_emailController.text,password: _passController.text);
  FirebaseUser user=result.user;
  Firestore.instance.collection('userData').document(user.uid).setData(
        { 
          'username':_usernameController.text,
          
           'phonenumber':_phonenumberController.text,
           'email':_emailController.text,
           'pass':_passController.text,
           'userUid':user.uid,
 
        }
    
  );
  return true;
}
  catch(e){
  
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      e.toString()
    ),),);
  return false;
}
  }
//validation

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


if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}
}
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
           hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:18),
           enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey,width:1.0),
             //borderRadius: BorderRadius.circular(20)
           ),
           focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,width:1.0),
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
      
       body: SafeArea(
         child: Container(
             //width: double.infinity,
             
        color:Colors.white,
         child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             
            children:[
         
        
           Align(
             alignment: Alignment.topLeft,
           
          child:SizedBox(
            width: 80.w,
          height: 90.h,
             child: //Image.network('https://i.etsystatic.com/7673973/r/il/64bd6a/2996029273/il_570xN.2996029273_tbtq.jpg'),)
             Image.asset('assets/logo3.png'),),
         
           ),
           Center(
                 child: Row(children: [ Padding(
                 padding: const EdgeInsets.only(top:80,left:25),
                 child: const Text("Women Safer" ,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pinkAccent,fontSize: 27,fontWeight: FontWeight.bold),),
             ),
            
            Padding(
                 padding: const EdgeInsets.only(right: 10,left:0,top:0,bottom:0),
                 child: Image.asset('assets/womyn2.jpg',width: 140.w,height: 200.h),
             ),
             ]),
               ),
         
          
        
               Column(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                   
                    
                   children: [
                    
                    
                     textfield(hintText: "User Name",
                  
                    
                     obscureText: false, controller: _usernameController,
                   
                     ),
                     SizedBox(height:10),
                     textfield(hintText: "PhoneNumber",
                     
                     obscureText: false, controller: _phonenumberController,
                   
                     ),SizedBox(height:10),
                     textfield(hintText: "Email",
                     
                     obscureText: false, controller: _emailController,
                   
                     ),SizedBox(height:10),
                    
                     textfield(hintText: "Password",
                    
                     obscureText: true, controller: _passController,
                    
                     ),SizedBox(height:15),
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
                   child: Text("Register",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                  Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0,2.0),
                      ),
               ]),),
                         onPressed: ()async{
                            final username=_usernameController.text.toString().trim();
           
            final email=_emailController.text.toString().trim();
            final phonenumber=_phonenumberController.text.toString().trim();
           final pass=_passController.text.toString().trim();
           bool result = await registerUser(username,phonenumber,email,pass);
           if(result){
             Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>LoginPage()
               ));
         
           }
           else{
             validation();
           }

                         }),
                         ),
                         SizedBox(height:30),
                   ],
                  
                 ),
            ])
            
             ),
           ),
         
            
         );
        
  }
}