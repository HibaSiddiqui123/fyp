
import 'package:flutter/material.dart';
import 'package:navbar_screens/login.dart';
import 'emergencymodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmergencyCard extends StatelessWidget {
  final EmergencyModel emergencyModel;
  EmergencyCard({required this.emergencyModel});

  

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
                        "${emergencyModel.name.toString()}",
                        style: TextStyle(color: Colors.pinkAccent, fontSize: 22),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Contact: ${emergencyModel.phone_number}",
                        style: theme.textTheme.caption!.copyWith(
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 1.0,
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
          secondaryActions: [
            IconSlideAction(
              color: Colors.pinkAccent,
              icon: Icons.phone,
              foregroundColor: Colors.white,
              onTap: () async {
               _makePhoneCall("tel: ${emergencyModel.phone_number}");
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
    Future<void> _makePhoneCall(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

}