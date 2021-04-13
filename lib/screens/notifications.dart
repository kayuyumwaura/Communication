import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
title:"Cash expense",
debugShowCheckedModeBanner: false,
home: Notifications(),
    );
  }
}

class Notifications extends StatefulWidget{
State<StatefulWidget> createState()=>NotificationsState();
}
class NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
            },);
          }
        ),
        backgroundColor: Colors.blueGrey,
        //backgroundColor: Color.fromRGBO(230, 230, 230, 10.0),
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
        //actions: [IconButton(icon: Icon(Icons.notifications_none, color: Colors.blueGrey[900],), onPressed: (){})],
      ),
 body: Screen1(),     
  //     drawer: Drawer(
  //         child: ListView(
  //   children: <Widget>[
  //     ListTile(
  //       title: Text("Item 1"),
  //       trailing: Icon(Icons.arrow_forward),
  //     ),
  //     ListTile(
  //       title: Text("Item 2"),
  //       trailing: Icon(Icons.arrow_forward),
  //     ),
  //      ListTile(
  //       title: Text("Item 3"),
  //       trailing: Icon(Icons.arrow_forward),
  //     ),
  //     ListTile(
  //       title: Text("Item 4"),
  //       trailing: Icon(Icons.arrow_forward),
  //     ),
  //   ],
  // ),
  //     ), 
      
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Screen1State();
   }

class Screen1State extends State<Screen1> {

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        //color: Color.fromRGBO(230, 230, 230, 10.0),
      
          
      ),
       
    );
  }
   
}

