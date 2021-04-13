import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:saharadesk_dealer/screens/details.dart';
import 'package:saharadesk_dealer/screens/completed.dart';
import 'package:saharadesk_dealer/screens/pendingclosure.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Sahara Desk",
      debugShowCheckedModeBanner: false,
      home: ActiveDetailsCopy(
        tickets: tickets2,
      ),
    );
  }
}

class ActiveDetailsCopy extends StatefulWidget {
  final Tickets tickets;
  ActiveDetailsCopy({Key key, @required this.tickets}) : super(key: key);
  State<StatefulWidget> createState() => ActiveDetailsCopyState();
}

class ActiveDetailsCopyState extends State<ActiveDetailsCopy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          'Issue Details',
          style: TextStyle(color: Colors.white),
        ),
        // actions: <Widget>[
        //   new IconButton(
        //     icon: new Icon(Icons.notifications_on),
        //     onPressed: () {
        //       /*Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => UIApp(
        //                     tickets: tickets2,
        //                   )));*/
        //     },
        //   ),
        // ],
      ),
      body: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  Screen1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => Screen1State();
}

class Screen1State extends State<Screen1> with TickerProviderStateMixin {
  // int _counter = 0;
  // AnimationController _controller;
  // int levelClock = ((tickets2.slaPeriod) * 3600).toInt();
  //DateTime assigneddate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(tickets2.issueCreationTime);

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //       vsync: this, duration: Duration(seconds: levelClock));
  //   _controller.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Station Name
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  // title
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // text
                        Text(
                          tickets2.stationLocation,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //body
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        // semi title
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GENERAL",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ), // space
                            ],
                          ),
                        ),

                        //issue date
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Issue Date:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Text(
                                    tickets2.issueCreationTime,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.redAccent,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //issuetype
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Category of Works:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Expanded(
                                    child: Text(
                                      tickets2.issueType,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.redAccent,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.right,
                                      //softWrap: false,
                                      //overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //asset
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Asset:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Expanded(
                                    child: Text(
                                      tickets2.asset,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.redAccent,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.right,
                                      //softWrap: false,
                                      //overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //issue
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Issue Name:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Text(
                                    tickets2.issueName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.redAccent,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //description
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Issue Description:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      tickets2.description,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.redAccent,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.right,
                                      //softWrap: false,
                                      //overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Divider(color: Colors.grey[300],),

                        //priority
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "Priority:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Text(
                                    tickets2.priority,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.redAccent,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //sla period
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              20), //space around container. i.e, size of container vs elements inside
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // icon
                                  Text(
                                    "SLA Period:",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // text
                                  Text(
                                    (tickets2.slaPeriod).toString() + " Hrs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.redAccent,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              //             Countdown(
                              //   animation: StepTween(
                              //     begin: levelClock, // THIS IS A USER ENTERED NUMBER
                              //     end: 0,
                              //   ).animate(_controller),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inHours.remainder(60).toString()}:${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inHours ${clockTimer.inMinutes.toString()}');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print(
        'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 50,
        color: Colors.redAccent,
      ),
    );
  }
}
