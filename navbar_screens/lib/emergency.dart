import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  const Emergency({ Key? key }) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {

  List<NotificationModel> listNotifications = [];

Future <void> display()async{
  listNotifications = [];
  try{
  final List<NotificationModel>loadedProduct = [];
  var response =  await FirebaseFirestore.instance.collection("notifications").where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
  if(response.docs.length > 0){
    response.docs.forEach((result) {
      loadedProduct.add(NotificationModel(
        title: result["title"],
        message: result["message"],
        timeStamp: result['created on'].toString()
        ));
    });
    listNotifications.addAll(loadedProduct);
      listNotifications.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));

    print(listNotifications);
  }
}
catch (e){
 print(e.toString());
}}
  @override
  void initState()
  {
    super.initState();
    setState(() {
    display();  
    });
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder(
        future: display(),
        builder: (ctx, snapshot) {
          return listView();
        }), 
       );
  }

PreferredSizeWidget appBar(){
  return AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.pinkAccent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  
            );
}

Widget listView(){
  return ListView.separated(itemBuilder: (context, index){
    return ListViewItem(listNotifications[index]);}, 
    separatorBuilder: (context, index){
      return Divider(height: 0,);
    }, itemCount: listNotifications.length);
}
Widget ListViewItem(NotificationModel notification){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefixIcon(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    message(notification),
                    timeAndDate(notification),
                  ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget prefixIcon(){
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade100,
    ),
    child: Icon(Icons.notifications, size: 25, color: Colors.grey.shade400),
  );
}

Widget message(NotificationModel notification){
  double textSize = 14;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
        Text(
          notification.message,
          style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        ),
      ],
    ),
//     child: RichText(
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//       text: TextSpan(
//         text: notification.title,
//         style: TextStyle(
//           fontSize: textSize,
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//         children: [
//           WidgetSpan(
//   child: Container(
//     //color: Colors.red,
//     padding: EdgeInsets.symmetric(horizontal: 20.0),
//     child: Text(notification.message),
//   )
// )
//             // TextSpan(
//             //   text: "Notification Description",
//             //   style: TextStyle(
//             //     fontWeight: FontWeight.w400,
//             //   ),
//             // )
//         ]
//       ),
//     ),
  );
}

Widget timeAndDate(NotificationModel notification){
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(notification.date, style: TextStyle(
          fontSize: 10,
        ),),
        Text(notification.time, style: TextStyle(
          fontSize: 10
        ),)
      ],
    ),
  );
}
}

class NotificationModel{
  final String title;
  final String message;
  String date = '';
  String time = '';
  var timeStamp;

NotificationModel({
  required this.title,
  required this.message,
  required this.timeStamp,
  
})
{
date = DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)));
time = DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)));

}
}