import 'package:flutter/material.dart';

class emegency extends StatefulWidget {
  const emegency({ Key? key }) : super(key: key);

  @override
  _emegencyState createState() => _emegencyState();
}

class _emegencyState extends State<emegency> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(), 
       );
  }

PreferredSizeWidget appBar(){
  return AppBar(
    backgroundColor: Colors.pink[400],
    title: const Text("Your Notifications"),
  );
}

Widget listView(){
  return ListView.separated(itemBuilder: (context, index){
    return ListViewItem(index);}, 
    separatorBuilder: (context, index){
      return Divider(height: 0,);
    }, itemCount: 15);
}
Widget ListViewItem(int index){
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
                    message(index),
                    timeAndDate(index),
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

Widget message(int index){
  double textSize = 14;
  return Container(
    child: RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: "Message",
        style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: [
          WidgetSpan(
  child: Container(
    //color: Colors.red,
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: Text("Notification Description"),
  )
)
            // TextSpan(
            //   text: "Notification Description",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //   ),
            // )
        ]
      ),
    ),
  );
}

Widget timeAndDate(int index){
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("07-02-2022", style: TextStyle(
          fontSize: 10,
        ),),
        Text("02:30", style: TextStyle(
          fontSize: 10
        ),)
      ],
    ),
  );
}
}