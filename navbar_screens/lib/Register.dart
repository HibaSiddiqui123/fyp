import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  void register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      User? user = userCredential.user;
      user!.updateDisplayName(usernameController.text);
      await user.reload();
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'userName': usernameController.text,
        'email': emailController.text,
        'number': phonenumberController.text,
        'address': "",
        'image': "",
        'about': "",
        'phonenumber': phonenumberController.text,
        'date':
            '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'
      });
      usernameController.clear();
      emailController.clear();
      passController.clear();
      phonenumberController.clear();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
      print(e);
    }
  }

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
                      hintText: "User Name",
                      obscureText: false,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "PhoneNumber",
                      obscureText: false,
                      controller: phonenumberController,
                    ),
                    const SizedBox(height: 10),
                    textfield(
                      hintText: "Email",
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
                          onPressed: () {
                            if(phonenumberController.text == "" || usernameController.text == "" || emailController.text == "" || passController.text == "")
                            {
                              var snackBar = SnackBar(
                                content: Text("Fields cannot be empty!"),
                                action: SnackBarAction(
                                label: "Close",
                                onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);          
                            }
                            else
                            {
                              register();
                              var snackBar = SnackBar(
                                content: Text("Registration Successfull!"),
                                action: SnackBarAction(
                                label: "Close",
                                onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);          
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
