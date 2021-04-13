import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/screens/addissue.dart';
import 'package:saharadesk_dealer/screens/completed.dart';
import 'package:saharadesk_dealer/screens/details.dart';
import 'package:saharadesk_dealer/screens/issues.dart';
import 'package:saharadesk_dealer/screens/more.dart';
import 'package:saharadesk_dealer/screens/notifications.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
title:"issues",
debugShowCheckedModeBanner: false,
home: BottomNav(),
    );
  }
}
class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    issues(),
    Completed(),
    Notifications(),
    More(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = issues(); // Our first view in viewport


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => AddIssue()),
      //         );
      //         },
      // ),

      
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            issues(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list_alt,
                          color: currentTab == 0 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Issues',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Completed(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                          color: currentTab == 1 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        //currentScreen = Notifications(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications_active,
                          color: currentTab == 2 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            More(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.more_vert_outlined,
                          color: currentTab == 3 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),

    );
  }

}