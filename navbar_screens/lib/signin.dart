import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:navbar_screens/home1.dart';
import 'signup.dart';
import 'splash1.dart';
import 'welcome.dart';
class LoginPage extends StatelessWidget {
  
final _emailController =TextEditingController();
  final _passController =TextEditingController();
  
 GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<FirebaseUser?> login(String phonenumber,String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
 AuthResult result =await _auth .signInWithEmailAndPassword(email: _emailController.text ,password: _passController.text);
  FirebaseUser user=result.user; 
  
  return user;
}catch(e){
  print(e);
  return null;
}
  }
  //validation

void validation(){


if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}

else if(_emailController.text.trim().isEmpty || _emailController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: 
    Text(
      "email is empty"
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
        controller: controller,
        /*validator: (value){
        if(_firstnameController.text.trim().isEmpty){
       globalKey.currentState!.showSnackBar(
      SnackBar(content: Text(
        "Fields are empty"
      ),),);
        }*/
        

        
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
      key: globalKey,
       body: SafeArea(
         child: Container(
           color: Colors.white,
             //width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal:1,vertical: 0),
        
         child:
            
            Column(
           mainAxisAlignment: MainAxisAlignment.start,
             children:[  
               
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
         
         
         Padding(
           padding: const EdgeInsets.only(top: 0,),
           
              child: Column(
                  // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                   
                    
                   children: [
                    
                    SizedBox(height:10),
                  /*  Padding(
                      padding: const EdgeInsets.only(right:220),
                      child: Text("Log-in",style: TextStyle(fontSize: 27,color: Colors.black,fontWeight:FontWeight.bold,)),
                  
                    ),*/
                    SizedBox(height:10),
                     textfield(hintText: "Email",
                     
                     obscureText: false, controller: _emailController,
                   
                     ),
                    SizedBox(height:20),
                     textfield(hintText: "Password",
                    
                     obscureText: true, controller: _passController,
                   
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 180),
                       child: Text("Forget Password?",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight:FontWeight.bold,)),
                     ),                     SizedBox(height:20),
                     Container(
                       width: 300,
               height: 50,
                       child: RaisedButton(
                          
               elevation: 7,
                 color: Colors.pinkAccent,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                   //side: BorderSide(color: Colors.red,width: 2),
                   
                   ),
                   child: Text("Login",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                  Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0,2.0),
                      ),
               ]),),
                         onPressed: ()async{
                           final email=_emailController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             FirebaseUser? user = await login(email, pass);
             
             if(user !=null){
              /* Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>
                 ));*/

             }else{
              validation();
               Navigator.of(context).pushReplacement(
               MaterialPageRoute(
                 builder:(context)=> home1(),
               ),
               );
             }
                         })),
                      SizedBox(height: 16,),
                           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             
             children: [
               Text("Don't have an Account?",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight:FontWeight.bold),),
               GestureDetector(child: Text("Register Now",style: TextStyle(fontSize: 15,color: Colors.pinkAccent,fontWeight:FontWeight.bold),
               ),
               onTap:(){
                  Navigator.of(context).pushReplacement(
               MaterialPageRoute(
                 builder:(context)=> Signup(),
               ),
             );
               }
               ),
              
                //IconButton(onPressed: (){}, icon:Icons.gmail_acc)
             ],
            ),
            SizedBox(height:20),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height:36,
                      
                    )),
              ),
              
              Text("Or login with",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold,color: Colors.grey)),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left:120,right:120),
              child: Row(

              children:[
               IconButton(onPressed: (){  },icon:Icon(Icons.facebook),color:Colors.blue,iconSize:46),
               SizedBox(width:18),
                CircleAvatar(
                  radius:20,
                  backgroundColor:Colors.white,
                 child :Image.asset("assets/google.png")
                )
               ]),
            )
                   ],
                  
                  
                 ),
                
                 
       
             ),
           
         
            ]
         ),
         ),
       )
    );
  }
}