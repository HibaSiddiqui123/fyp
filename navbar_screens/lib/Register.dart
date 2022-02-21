import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:navbar_screens/notification_api.dart';
import 'package:phone_number/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:future_progress_dialog/future_progress_dialog.dart';

import 'login.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
  }
String out = "";
  Future<void> register() async {
    
    
          
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )
        .then((value) async {
      User? user = value.user;
      user!.updateDisplayName(usernameController.text);
      await user.reload();
      print("Registered Account");
      firebase_storage.FirebaseStorage storage =
              firebase_storage.FirebaseStorage.instance;
          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('profileimages/${user.uid}');

          File f = await getImageFileFromAssets('womyn3.jpg');
          await ref.putFile(f);
          String downloadURL = await ref.getDownloadURL();
          print(downloadURL);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'userName': usernameController.text,
        'email': emailController.text,
        'address': '',
        'image': downloadURL,
        'about': '',
        'user_Id': FirebaseAuth.instance.currentUser!.uid,
        'phonenumber': phonenumberController.text,
        'date':
            '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'
      });
      print("Database Set");
      notificatons();
      NotificationApi.showNotification(
          title: 'Registeration', body: 'Sucessfull', payload: '');
      
      setState(() {
        out = "Account Registered Successfully!";
      });
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => loginUser()),
      //     (route) => false);
    }).catchError((error, stackTrace) {
      switch (error.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        out = "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        out = "Wrong email/password combination.";
        break;
      case "weak-password":
        out = "Weak Password!";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        out = "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        out = "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        out = "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        out = "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        out = "Email address is invalid.";
        break;
      default:
        out = "Login failed. Please try again.";
    }
    });
    print(out);
  }

  notificatons() async {
    try {
      await FirebaseFirestore.instance.collection("notifications").add({
        'title': "Welcome!",
        'message': "Your Account has been registered successfully!",
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'created on': DateTime.now().millisecondsSinceEpoch,
      });
      print("Notification Generated");
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  setData() async {
    try {} on Exception catch (e) {
      // TODO
      print(e.toString());
      CircularProgressIndicator();
    }
  }

  @override
  void initState() {
    super.initState();
    // NotificationApi.init();
    // listenNotifications();
  }
// void listenNotifications() => NotificationApi.onNotifications.stream.listen(onClickedNotification);
// void onClickedNotification(String? payload) =>
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginUser(payload: payload,)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 80.w,
                    height: 90.h,
                    child: //Image.network('https://i.etsystatic.com/7673973/r/il/64bd6a/2996029273/il_570xN.2996029273_tbtq.jpg'),)
                        Image.asset('assets/logo3.png'),
                  ),
                ),
                Center(
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80, left: 25),
                      child: Text(
                        "WomenSafer",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.pinkAccent,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 0, top: 0, bottom: 0),
                      child: Image.asset(
                        'assets/womyn2.jpg',
                        width: 140.w,
                        height: 200.h,
                      ),
                    ),
                  ]),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textfield(
                      hintText: "Full Name",
                      obscureText: false,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "Phone Number",
                      obscureText: false,
                      controller: phonenumberController,
                    ),
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "Email Address",
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "Password",
                      obscureText: true,
                      controller: passController,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 300.w,
                      height: 50.h,
                      child: RaisedButton(
                          //splashColor: Colors.red,
                          elevation: 7,
                          color: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //side: BorderSide(color: Colors.red,width: 2),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.grey,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ]),
                          ),
                          onPressed: () async {
                            PhoneNumberUtil plugin = PhoneNumberUtil();

                            if (phonenumberController.text == "" ||
                                usernameController.text == "" ||
                                emailController.text == "" ||
                                passController.text == "") {
                              var snackBar = SnackBar(
                                content: Text("Fields cannot be empty!"),
                                action: SnackBarAction(
                                  label: "Close",
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              String springFieldUSASimpleNoRegion =
                                  phonenumberController.text;
                              RegionInfo region = RegionInfo(
                                  code: 'PK', name: 'Pakistan', prefix: 92);
                              bool isValid = await plugin.validate(
                                  springFieldUSASimpleNoRegion, region.code);

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);
                              if (isValid && emailValid) {
                                // SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
                                // _dialog.show(message: 'Loading...', type: SimpleFontelicoProgressDialogType.hurricane);
                                await showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(register(), message: Text('Loading...')),
    );
    print(out);
    if(out == "Account Registered Successfully!")
    {
Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => loginUser()),
          (route) => false);
    }
    else
    {
                          final snackBar = SnackBar(content: Text(out));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
    }
  // String res = await register();
      
  // _dialog.hide();
                                
                              } else {
                                if (isValid == false) {
                                  final snackBar = SnackBar(
                                      content: const Text("Inavlid Number"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (!emailValid) {
                                  final snackBar = SnackBar(
                                      content: const Text("Inavlid Email"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            }
                          }),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

Widget textfield(
    {required String hintText,
    required bool obscureText,
    required TextEditingController controller}) {
  return Container(
    width: 300.w,
    height: 50.h,
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          )),
    ),
  );

}