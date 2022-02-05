import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/Register.dart';
import 'package:navbar_screens/main.dart';

class loginUser extends StatefulWidget {
  const loginUser({Key? key}) : super(key: key);

  @override
  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  child:
                      Image.asset('assets/womyn2.jpg', width: 140, height: 200),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 180),
                    child: Text("Forget Password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
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
                      onPressed: () {
                        loginUser();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => homescreen(),
                          ),
                        );
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
                    const Text("Or login with",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 120, right: 120),
                    child: Row(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                          color: Colors.blue,
                          iconSize: 46),
                      const SizedBox(width: 18),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/google.png"))
                    ]),
                  )
                ],
              ),
            ),
          ]),
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
