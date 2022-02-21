import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/sharedprefrences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/Register.dart';
import 'package:navbar_screens/forgotpass.dart';
import 'package:navbar_screens/main.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:navbar_screens/notification_api.dart';

class loginUser extends StatefulWidget {
  const loginUser({Key? key, String? payload}) : super(key: key);

  @override
  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  _storeLoginInfo() async {
    int isLogin = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('state', isLogin);
    print("storeLogin");
  }

  final firebaseInstance = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  googleLogIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
          value.exists ? out = "Found" : FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set({
          'userName': _user!.displayName,
          'email': _user!.email,
          'address': "",
          'image': _user!.photoUrl,
          'about': "",
          'phonenumber': "",
          'user_Id': FirebaseAuth.instance.currentUser?.uid,
          'date':
              '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'
        });
        });   
        
        notificatons();
        NotificationApi.showNotification(
            title: 'LoggedIn', body: 'Sucessfull', payload: '');
      });
      print("Signed In");
    } on Exception catch (e) {
      print(e.toString());
      // TODO
    }
  }
  String out = "";
  Future<void> loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text);

      if (userCredential != null) {
        // sharedPrefrences().setInstance(1);
        setState(() {
          out = "Successfully Logged In";
        });
        _storeLoginInfo();
        NotificationApi.showNotification(
            title: 'Logged In', body: 'Sucessfull', payload: '');
        notificatons();
      }
      else
      {
        setState(() {
          out = "Error";
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        final snackBar = SnackBar(content: const Text("No user found for that email."));
        ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
        print('No user found for that email.');
        setState(() {
          out = "Error";
        });
      } else if (e.code == 'wrong-password') {
        final snackBar = SnackBar(content: const Text("Invalid Email or Password"));
        ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
setState(() {
          out = "Error";
        });
        print('Wrong password provided for that user.');
      }
    }
  }

  notificatons() async {
    try {
      FirebaseFirestore.instance.collection("notifications").add({
        'title': "Welcome Back",
        'message': 'Login Sucessfull',
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'created on': DateTime.now().millisecondsSinceEpoch,
      });
    } on Exception catch (e) {
      print(e.toString());
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
  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => homescreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            color: Colors.white,
            child: Column(children: [
              Center(
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80, left: 25),
                    child: Text(
                      "Women Safer",
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
                    child: Image.asset('assets/womyn2.jpg',
                        width: 140, height: 200),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                child: Column(
                  // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    /*  Padding(
                        padding: const EdgeInsets.only(right:220),
                        child: Text("Log-in",style: TextStyle(fontSize: 27,color: Colors.black,fontWeight:FontWeight.bold,)),
                      ),*/
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    textfield(
                      hintText: "Password",
                      obscureText: true,
                      controller: passController,
                    ),
                    SizedBox(height: 10),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 180),
                    //   child: Text("Forget Password?",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.bold,
                    //       )),
                    // ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPass()));
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        child: const Text(
                          "Login",
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
                                                     await showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(loginUser(), message: Text('Authenticating...')),
    );
                          if(out == "Successfully Logged In")
                          {
                            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => homescreen()),
            (route) => false);
        

                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Account?",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterUser(),
                                ),
                              );
                            }),

                        //IconButton(onPressed: (){}, icon:Icons.gmail_acc)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      const Text("Or SignUp with",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                          onPrimary: Colors.white,
                        ),
                        icon: FaIcon(FontAwesomeIcons.google),
                        label: const Text(
                          "SignIn With Google",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () async {
                                                                         await showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(googleLogIn(), message: Text('Authenticating...')),
    );
                          // final snackBar = SnackBar(content: Text(res));
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // _dialog.hide();
                          if(out == "Found")
                          {
                            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => homescreen()),
            (route) => false);
        

                          }
                        })
                  ],
                ),
              ),
            ]),
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
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            //borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            // borderRadius: BorderRadius.circular(20)
          )),
    ),
  );
}
