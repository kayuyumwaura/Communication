import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
title:"Profile", 
debugShowCheckedModeBanner: false,
home: Profile(),
    );
  }
}

class Profile extends StatefulWidget{
State<StatefulWidget> createState()=>ProfileState();
}

class ProfileState extends State<Profile> {
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        //backgroundColor: Color.fromRGBO(230, 230, 230, 10.0),
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        //actions: [IconButton(icon: Icon(Icons.notifications_none, color: Colors.blueGrey[900],), onPressed: (){})],
      ),
        body: SafeArea( child: Container(),)
    );
  }
}
    