import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:saharadesk_dealer/screens/addissue.dart';
import 'package:saharadesk_dealer/screens/home.dart';
import 'package:saharadesk_dealer/screens/issues.dart';
import 'package:saharadesk_dealer/screens/pendingclosure.dart';
import 'package:saharadesk_dealer/widgets/navdrawer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Sahara Desk",
      debugShowCheckedModeBanner: false,
      home: UIApp(
        tickets: tickets2,
      ),
    );
  }
}

class UIApp extends StatefulWidget {
  final Tickets tickets;
  UIApp({Key key, @required this.tickets}) : super(key: key);
  State<StatefulWidget> createState() => UIAppState();
}

class UIAppState extends State<UIApp> {
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
  Future<IssuesCreate> postIssues;
  int _counter = 0;
  AnimationController _controller;
  /*Duration difference = DateTime.now()
      .difference(DateTime.parse(tickets2.dateContractorAssigned));*/
  int levelClock = ((tickets2.slaPeriod * 3600).toInt() -
              DateTime.now()
                  .difference(DateTime.parse(tickets2.dateContractorAssigned)
                      .add(const Duration(hours: 3)))
                  .inSeconds) >
          0
      ? ((tickets2.slaPeriod * 3600).toInt() -
          DateTime.now()
              .difference(DateTime.parse(tickets2.dateContractorAssigned)
                  .add(const Duration(hours: 3)))
              .inSeconds)
      : 0;
  //int levelClock = ((tickets2.slaPeriod) * 3600).toInt();
  //DateTime assigneddate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(tickets2.issueCreationTime);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    _controller.forward();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                                  fontWeight: FontWeight.normal,
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
                                    "ISSUE DATE:",
                                    style: TextStyle(
                                      fontSize: 15,
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
                                      fontSize: 16.0,
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
                                    "CATEGORY OF WORKS:",
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                        fontSize: 16.0,
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
                                    "ASSET:",
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                        fontSize: 15.0,
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
                                    "ISSUE NAME:",
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //description
                        // Container(
                        //   color: Colors.white,
                        //   width: double.infinity,
                        //   padding: EdgeInsets.all(
                        //       20), //space around container. i.e, size of container vs elements inside
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           // icon
                        //           Text(
                        //             "ISSUE DESCRIPTION:",
                        //             style: TextStyle(
                        //               fontSize: 15.0,
                        //               color: Colors.blueGrey,
                        //               fontWeight: FontWeight.normal,
                        //             ),
                        //           ),
                        //           // text
                        //           Expanded(
                        //             child: Text(
                        //               tickets2.description,
                        //               style: TextStyle(
                        //                 fontWeight: FontWeight.normal,
                        //                 color: Colors.redAccent,
                        //                 fontSize: 16.0,
                        //               ),
                        //               textAlign: TextAlign.right,
                        //               //softWrap: false,
                        //               //overflow: TextOverflow.fade,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),

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
                                    "PRIORITY:",
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                      fontSize: 16.0,
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
                                    "SLA PERIOD:",
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Countdown(
                                animation: StepTween(
                                  begin:
                                      levelClock, // THIS IS A USER ENTERED NUMBER
                                  end: 0,
                                ).animate(_controller),
                              ),
                            ],
                          ),
                        ),


          ],
        ),
      ),
           ] )
      )
          ])
      
      ),
     
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
              children : <Widget>[
                //button1

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print("object" + (tickets2.id).toString() );
                      OnSite().TechnicianOnSite(tickets2.id);
                    });
              //class.method
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                      BottomNav()
                      ));
            },
                  child: Container(
                                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                        height: 40.0,
                                        child: Material(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            shadowColor: Colors.redAccent,
                                            color: Colors.redAccent,
                                            elevation: 7.0,
                                            child: Center(
                                              child: Text('On Site',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      // fontSize: 16.0,
                                                      // fontWeight:
                                                      //     FontWeight.normal
                                                          )),
                                            )),
                                      )
                  )
                      ),
                      
                //button2
                Expanded(
                child: GestureDetector(
                  onTap: 
                  (){ print(tickets2.id);
                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddIssue(tickets: tickets2,)));
                  },
                  child: Container(
                                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                        height: 40.0,
                                        child: Material(
                                            borderRadius:
                                                BorderRadius.circular(30.0), 
                                            shadowColor: Colors.redAccent,
                                            color: Colors.white,
                                            elevation: 7.0,
                                            //shape: RoundedRectangleBorder(side: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.redAccent )),
                                            child: Center(
                                              child: Text('Request Closure',
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      // fontSize: 16.0,
                                                      // fontWeight:
                                                      //     FontWeight.normal
                                                          )),
                                            )),
                                      )
                  )
                      ),
                ],
              ),
        // child: RaisedButton(
        //   onPressed: () {},
        //   color: Colors.blue,
        //   textColor: Colors.white,
        //   child: Text('Fixed Button'),
        // ),
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

    /*print('animation.value  ${animation.value} ');
    print('inHours ${clockTimer.inMinutes.toString()}');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print(
        'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');*/

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 35,
        color: Colors.redAccent,
      ),
    );
  }
}
