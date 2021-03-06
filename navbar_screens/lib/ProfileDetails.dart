import 'package:firebase_core/firebase_core.dart';
import 'package:phone_number/phone_number.dart';

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:navbar_screens/profilemodel.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  var image = "";
  String docID = "";

  @override
  void initState() {
    firebaseInstance
        .collection('users')
        .where('user_Id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        image = value.docs[0].data()['image'];
        print(image);
        docID = value.docs[0].id;
        print(docID);
        nameController.text = value.docs[0].data()['userName'];
        contactController.text = value.docs[0].data()['phonenumber'];
        aboutController.text = value.docs[0].data()['about'];
        addressController.text = value.docs[0].data()['address'];
      });
    });

    super.initState();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  final _globalkey = GlobalKey<FormState>();

  late ProfileModel model;
  final firebaseInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  PickedFile? imageFile;
  String? Imagepath;
  final ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //getProfile();

    Future<void> Submit() async {
      try {
        User? firebaseUser = FirebaseAuth.instance.currentUser;
        firebaseUser!.updateDisplayName(nameController.text);
        
        await firebaseInstance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
          'userName': nameController.text,
          'phonenumber': contactController.text,
          'address': addressController.text,
          'about': aboutController.text,
        });
        if (imageFile != null) {
          firebase_storage.FirebaseStorage storage =
              firebase_storage.FirebaseStorage.instance;
          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('profileimages/${auth.currentUser!.uid}');

          File file = File(imageFile!.path);
          await ref.putFile(file);
          String downloadURL = await ref.getDownloadURL();
          print(downloadURL);
          await firebaseInstance.collection('users').doc(docID).set({
            "image": downloadURL,
          }, SetOptions(merge: true));
        }
        
        print("Post Uploaded Sucessfully");
        var snackBar = SnackBar(
          content: Text("Profile Updated Successfully!"),
          action: SnackBarAction(
            label: "Close",
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,
        centerTitle: true,
        title: Center(
          child: Row(
            children: [
              Text(
                "Profile Details",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _globalkey,
          child: ListView(
            children: <Widget>[
              profileImage(image),
              const SizedBox(height: 20.0),
              buildTextField("Full Name", "Alexa", false, nameController),
              //buildTextField("Email", "Alexa@abc.com", false, emailController),
              buildTextField(
                  "Contact", "+92xxxxxxxxxx", false, contactController),
              buildTextField("Address", "your city", false, addressController),
              buildTextField("About", "Type something about yourself....",
                  false, aboutController),

              // nameTextField("Name",nameController, Icons.person),
              // const SizedBox(height: 20.0),
              // nameTextField("Contact",contactController, Icons.call),
              // const SizedBox(height: 20.0),
              // nameTextField("Address",addressController, Icons.home),
              // const SizedBox(height: 20.0),
              // nameTextField("About",aboutController, Icons.person),
              // const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () async {
                    PhoneNumberUtil plugin = PhoneNumberUtil();
                    String springFieldUSASimpleNoRegion =
                        contactController.text;
                    RegionInfo region =
                        RegionInfo(code: 'PK', name: 'Pakistan', prefix: 92);
                    bool isValid = await plugin.validate(
                        springFieldUSASimpleNoRegion, region.code);
                    if (isValid) {
                      if (contactController.text != "")  {
                            await showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(Submit(), message: Text('Updating...')),
    );
                        
                      } else {
                        final snackBar = SnackBar(
                            content:
                                const Text("Contact Number cannot be empty!"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      final snackBar =
                          SnackBar(content: const Text("Inavlid Number"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("UPDATE"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomsheet() {
    void takePhoto(ImageSource source) async {
      final pickedFile = await imagePicker.getImage(source: source);
      setState(() {
        imageFile = pickedFile;
        Imagepath = imageFile!.path;
      });
    }

    ;

    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                  icon: Icon(Icons.camera),
                  label: Text(
                    "Camera",
                  )),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                  icon: Icon(Icons.image),
                  label: Text("Gallery"))
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            cursorColor: Colors.pinkAccent,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.pinkAccent,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }

  Widget profileImage(String? passedImage) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageFile == null
                    ? (passedImage == ""
                        ? AssetImage('womyn3.jpg') as ImageProvider
                        : NetworkImage(passedImage.toString()))
                    : FileImage(File(imageFile!.path)),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.white),
                    color: Colors.pinkAccent),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context, builder: (builder) => bottomsheet());
                  },
                  child: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget nameTextField(
      String name, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.pinkAccent,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.pinkAccent,
            width: 2,
          )),
          prefixIcon: Icon(icon, color: Colors.pinkAccent),
          labelText: name,
          //helperText: name + " can't be empty",
          hintText: "Enter " + name),
      controller: controller,
    );
  }
}