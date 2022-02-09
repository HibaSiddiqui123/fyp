import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'contactcard.dart';
import 'contactmodel.dart';


class phone extends StatefulWidget {
  const phone({ Key? key }) : super(key: key);

  @override
  _phoneState createState() => _phoneState();
}

class _phoneState extends State<phone> {
List<ContactModel> listContacts = [];
final firebaseInstance = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
  
Future<void> display() async{
      listContacts = [];
  try {
    final List<ContactModel> lodadedProduct = [];
 var response = await firebaseInstance.collection("Contacts").where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
 if (response.docs.length > 0){
   response.docs.forEach((result) {
     lodadedProduct.add(ContactModel(
        name: result["Username"],
        phone_number: result["Phone Number"], 
        relation: result["Relation"],
        docID: result.id,
     ));    
   });
   listContacts.addAll(lodadedProduct);
   print(listContacts);
   
 }
  } catch (e) {
  }
}


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(listContacts);
    return Scaffold(
      body: FutureBuilder(
        future: display(),
        builder: (context, index){
          return 
          Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.pinkAccent,
              elevation: 0.0,
              title: Row(
                children: [
                  Text(
                    "Contacts List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            body:Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0),
                            child: Container(
                              // margin: EdgeInsets.only(left: 1, bottom: 1, right: 1),

                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.87,
                              child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ContactCard(
                              contactModel: listContacts[index],
                            );
                          },
                          itemCount: listContacts.length,
                        ),
          )
                    )
                      ]),
              )
                ]),
          )
          );
                  
          })
    );
    }
    
  }