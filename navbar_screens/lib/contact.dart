import 'package:flutter/material.dart';

import 'emergencycard.dart';
import 'emergencymodel.dart';


class contact extends StatefulWidget {
  const contact({ Key? key }) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
List<EmergencyModel> listContacts = [
EmergencyModel(
  name: "Women Helpline",
  phone_number : "1099"
),
EmergencyModel(
  name: "Domestic Abuse",
  phone_number : "115"
),
EmergencyModel(
  name: "Police",
  phone_number : "15"
),
EmergencyModel(
  name: "WomenSafer",
  phone_number : "+92312345678"
)
];

  


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(listContacts);
    return  Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.pinkAccent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                      "Emergency Contacts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
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
                          padding: EdgeInsets.only(top: 8.0, right: 20.0),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Icon(
                                Icons.arrow_left,
                                color: Colors.red,
                              ),
                              Text(
                              "Swipe Left for Call",
                                style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        ),
                        
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
                            return EmergencyCard(
                              emergencyModel: listContacts[index],
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
                  
    }
    
  }