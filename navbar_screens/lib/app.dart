// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class app extends StatefulWidget {
//   const app({ Key? key }) : super(key: key);

//   @override
//   _appState createState() => _appState();
// }

// class _appState extends State<app> {
//   @override

//   final googleSignIn = GoogleSignIn();
//   GoogleSignInAccount? _user;
//   GoogleSignInAccount get user => _user!;
  
//   googleLogin()async{
//     final googleUser =  await googleSignIn.signIn();
//     if(googleUser == null)return;
//     _user = googleUser;

//     final googleAuth = await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//       );

//     await FirebaseAuth.instance.signInWithCredential(credential);
//     }

//     setData()async{
//       await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).set({
//         "name": user.displayName!,
//         "email": user.email,
//       });
//     }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: googleLogin(),
      
//     );
//   }
// }