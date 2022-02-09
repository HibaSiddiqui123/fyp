
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:navbar_screens/login.dart';
import 'contactmodel.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactCard extends StatelessWidget {
  final firebaseInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final ContactModel contactModel;
  ContactCard({required this.contactModel});
  
final db = FirebaseFirestore.instance;

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController relationController = TextEditingController();

updateData()async{
    await FirebaseFirestore.instance.collection("Contacts").doc(contactModel.docID).update({
    "Username": nameController.text,
    "Phone Number": phoneController.text,
    "Relation": relationController.text,    
  });
}

deleteData()async{
  await FirebaseFirestore.instance.collection("Contacts").doc(contactModel.docID).delete();
}

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.white,
              height: 80.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${contactModel.name.toString()}",
                        style: TextStyle(color: Colors.pinkAccent, fontSize: 16),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Phone: ${contactModel.phone_number}",
                        style: theme.textTheme.caption!.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        "Relation: ${contactModel.relation}",
                        style: theme.textTheme.caption!.copyWith(
                          fontSize: 10.0,
                        ),
                      ),
                      // Text(
                      //   "id: ${contactModel.docID}",
                      //   style: theme.textTheme.caption!.copyWith(
                      //     fontSize: 10.0,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Card Actions
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            IconSlideAction(
              color: Colors.red,
              icon: Icons.delete,
              foregroundColor: Colors.white,
              onTap: () async {
               return showDialog(context: context, builder: (context){
                 return AlertDialog(title: Text("Delete Item"),
                 content: Text("Are you sure to delete this item from your list"),
                 actions: [
                    FlatButton(onPressed: (){
                      deleteData();
                      Navigator.pop(context);
                    }, child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.bold))),
                    FlatButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel", style: TextStyle(fontWeight:FontWeight.bold ),))
                 ],
                 );
               });
              },
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.blue,
              icon: Icons.edit,
              foregroundColor: Colors.white,
              onTap: () async {
                return showDialog(context: context, builder: (context){
                  nameController.text = contactModel.name;
                  phoneController.text = contactModel.phone_number;
                  relationController.text = contactModel.relation;
                  return AlertDialog(
                    title: Text("Edit Contact"),
                    content: SingleChildScrollView(

                      child: Container(
                        height: MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.width*0.3,
                       
                        child: Column(
                          children: [
                            textfield(hintText: "Name", obscureText: false, controller: nameController),
                            textfield(hintText: "PhoneNumber", obscureText: false, controller: phoneController),
                            textfield(hintText: "Relation", obscureText: false, controller: relationController),                            
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      FlatButton(onPressed: (
                        
                      ){
                        updateData();
                        nameController.clear();
                        phoneController.clear();
                        relationController.clear();
                        Navigator.pop(context);
                      }, child: Text("Edit",style: TextStyle(fontWeight: FontWeight.bold),)),
                      FlatButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel", style: TextStyle(fontWeight:FontWeight.bold ),)),
                    ],
                  );
                });                 
              },
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );

  }
}