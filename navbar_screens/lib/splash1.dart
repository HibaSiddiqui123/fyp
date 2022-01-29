import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addcontact.dart';
import 'welcome.dart';
import 'splash2.dart';
class Splash  extends StatefulWidget {
  const Splash ({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 100000000000000),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          const Welcome()
                                                         )
                                       )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.pink[200],
      body: Container(
        
         width: double.infinity.w,
         height: double.infinity.h,
      //width: double.infinity,
     // margin: EdgeInsets.symmetric(horizontal:2),
     
      color:Colors.pink,
       
    child:Column(

      children: [
        Container(
    // width: double.infinity.w,
     height: 600.h,
          decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30)

      ),
      color:Colors.white,
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Align(
             alignment: Alignment.topLeft,
          child:SizedBox(
            width: 100.w,
          height: 120.h,
             child: //Image.network('https://i.etsystatic.com/7673973/r/il/64bd6a/2996029273/il_570xN.2996029273_tbtq.jpg'),)
             Image.asset('assets/logo3.png'),),

          ),
         
        Center(
          child: RichText(
  text: const TextSpan(
    text: '        Women Safer\n ',
    style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pinkAccent,fontSize: 30,fontWeight: FontWeight.bold),
    children: <TextSpan>[
      
      TextSpan(text:'" Give us freedom not feardom! "\n\n', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent,fontSize: 20)),
  
      TextSpan(text:   ' Get Started\n', style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15)),
    
      TextSpan(text:   ' Millions of people use to turn\n', style: TextStyle(height:1.5,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20)),
       TextSpan(text: '     their ideas into reality.', style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20)),
    ]
  )
    

          ),
        ) ,
          Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child:  
             Image.asset('assets/womyn0.jpg',width: 270.w,height: 270.h),  
          ) 
          ) 
    ]
       ),

     ),
     Center(
       child: Padding(
         padding: const EdgeInsets.only(top: 25),
         child: Row(
           
           mainAxisAlignment:MainAxisAlignment.spaceBetween,
           children: [
         Container(
           margin: EdgeInsets.symmetric(horizontal:10),
           width: 130.w,
           height:40.h,
            decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           
          
              ),
           
           child: RaisedButton(elevation: 0,
           color: Colors.pink,
           child:Text("Skip Now",style: TextStyle(color: Colors.pink[100],fontSize: 20),),
             onPressed: (){
Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>Addcontacts()
                 ));


             })),
             Container(
               margin: EdgeInsets.symmetric(horizontal:10),
                width: 80.w,
           height:40.h,
              decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           
         
              ),
           
               child: RaisedButton(
                 elevation: 6,
                  color:Colors.pink[100],
                child:Text("Next",style: TextStyle(color: Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
                 onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>Splashh()
                 ));
                 })
                 )
           ],
         ),
       ),
     )

      ],
    
    ),
    
    
      )
    );
  }
}