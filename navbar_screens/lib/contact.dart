import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/addcontact.dart';
import 'package:navbar_screens/contactmodel.dart';

class contact extends StatefulWidget {
  const contact({ Key? key }) : super(key: key);

  @override
  _contactState createState() => _contactState();
}



class _contactState extends State<contact> {
final List <ContactModel> loadedproduct = [];
final firebaseInstance = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
  
void display() async{
  try {
 var response = await firebaseInstance.collection("Contacts").where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
 if (response.docs.length > 0){
   response.docs.forEach((result) {
     print(result);
     loadedproduct.add(ContactModel(
        phone_number: result["Phone Number"],  
     ));    
   });
 }
  } catch (e) {
  }
}

  void initState(){
    setState(){}
  }
  @override
  Widget build(BuildContext context) {
    display();
    return Scaffold(
      body: 
      // FutureBuilder(
      //   future: display(),
      //   builder: (context, AsyncSnapshot snapshot){
      //     return ListView.builder(
      //       itemCount: snapshot.data.length,
      //       itemBuilder: (context, i) {
      //         return ListTile(
      //           title: Text(snapshot.data[i].phonenumber),
      //         );
      //       });
      //   },) 
      Center(
        child: Container(
          

          child: ElevatedButton(onPressed: display, child: const Text("Display"))
        ),
      ),
    );
  }
}


class ContactModel{
  String phone_number;
  

ContactModel({
  required this.phone_number,
});

}