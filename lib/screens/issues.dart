import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/main.dart';
import 'package:saharadesk_dealer/screens/activedetails.dart';
import 'package:saharadesk_dealer/screens/activedetailscopy.dart';
import 'package:saharadesk_dealer/screens/details.dart';
import 'package:saharadesk_dealer/screens/pendingclosure.dart';
import 'package:saharadesk_dealer/model/model.dart';

Future<void> main() async {
  await Future.delayed(Duration(seconds: 2));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "issues",
      debugShowCheckedModeBanner: false,
      home: issues(),
    );
  }
}

class issues extends StatefulWidget {
  issues({this.tickets1});
  String tickets1;
  State<StatefulWidget> createState() => issuesState();
}

class issuesState extends State<issues> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  var newCount = 0;
  var onGoingCount = 0;
  var pendingClosureCount = 0;
  List<Tickets> dataNew;

  @override
  void initState() {
    // initialise your tab controller here
    print('In here');
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
        newCount = dataNew.length;
      });
    });
    super.initState();
  }

  /*Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
     new MyApp();
  });*/

  @override
  Widget build(BuildContext context) {
    print('Ín here build');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          'Issues',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              onTap: (index) {
                // Should not used it as it only called when tab options are clicked,
                // not when user swapped
              },
              labelPadding: EdgeInsets.all(5),
              controller: _tabController,
              labelColor: Colors.redAccent,
              isScrollable: true,
              indicatorColor: Colors.redAccent,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              tabs: <Widget>[
                // Tab(
                //   text: 'New' + ' (' + '$newCount' + ')',
                // ),
                Tab(
                  text: 'New' + ' (' + '$onGoingCount' + ')',
                ),
                Tab(
                  text: 'Pending Closure' + ' (' + '$pendingClosureCount' + ')',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                //active
                // Container(
                //   color: Color.fromRGBO(242, 242, 242, 1),
                //   child: _issuesDataNew(),
                // ),

                //ongoing
                Container(
                  color: Colors.transparent,
                  child: _issuesDataPendingInProgress(),
                ),

                //pending closure
                Container(
                  color: Colors.transparent,
                  child: _issuesDataOnHold(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FutureBuilder _issuesData() {
  //   return FutureBuilder<List<Tickets>>(
  //     future: GetTickets().getIssues(),
  //     builder: (BuildContext context, AsyncSnapshot<List<Tickets>> snapshot) {
  //       if (snapshot.hasData) {
  //         List<Tickets> data = snapshot.data;
  //         return _issues(data);
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       }
  //       return Container(
  //         height: 60.0,
  //         child: new Center(child: new CircularProgressIndicator()),
  //       );
  //     },
  //   );
  // }

  // FutureBuilder _issuesDataNew() {
  //   return FutureBuilder<List<Tickets>>(
  //     future: GetTicketsNew().getIssues(),
  //     builder: (BuildContext context, AsyncSnapshot<List<Tickets>> snapshot) {
  //       if (snapshot.hasData) {
  //         dataNew = snapshot.data;
  //         //newCount = dataNew.length;
  //         print('In here 2');
  //         return _issues(dataNew);
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       }
  //       return Container(
  //         height: 60.0,
  //         child: new Center(child: new CircularProgressIndicator()),
  //       );
  //     },
  //   );
  // }

  FutureBuilder _issuesDataPendingInProgress() {
    return FutureBuilder<List<Tickets>>(
      future: GetTicketsNew().getIssues(),
      builder: (BuildContext context, AsyncSnapshot<List<Tickets>> snapshot) {
        if (snapshot.hasData) {
          List<Tickets> data = snapshot.data;
          onGoingCount = data.length;
          print('In here 3');
          return _issuesPending(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
          height: 60.0,
          child: new Center(child: new CircularProgressIndicator()),
        );
      },
    );
  }

  FutureBuilder _issuesDataOnHold() {
    return FutureBuilder<List<Tickets>>(
      future: GetTicketsOnhold().getIssues(),
      builder: (BuildContext context, AsyncSnapshot<List<Tickets>> snapshot) {
        if (snapshot.hasData) {
          List<Tickets> data = snapshot.data;
          pendingClosureCount = data.length;
          return _issuesOnHold(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
          height: 60.0,
          child: new Center(child: new CircularProgressIndicator()),
        );
      },
    );
  }
}

 Tickets tickets2;
// ListView _issues(data) {
//   return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: InkWell(
//             child: _tileissue(
//                 data[index].issueName,
//                 data[index].stationLocation,
//                 data[index].issueCreationTime,
//                 data[index].assigned),
//             onTap: () {
//               tickets2 = data[index];
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ActiveDetails(
//                             tickets: tickets2,
//                           )));
//             },
//           ),
//         );
//       });
// }

ListView _issuesPending(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
  shape: RoundedRectangleBorder(
    side: BorderSide(width: 5, color: Colors.white)),
          child: InkWell(
            child: _tileissue(
                data[index].issueName,
                data[index].stationLocation,
                data[index].issueCreationTime,
                data[index].assigned),
            onTap: () {
              tickets2 = data[index];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UIApp(
                            tickets: tickets2,
                          )));
            },
          ),
        );
      });
}

Tickets ticketspending;
ListView _issuesOnHold(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
  shape: RoundedRectangleBorder(
    side: BorderSide(width: 5, color: Colors.white)),
          //return ListTile(
          child: InkWell(
            child: _tileissue(
                data[index].issueName,
                data[index].stationLocation,
                data[index].issueCreationTime,
                data[index].assigned),
            onTap: () {
              ticketspending = data[index];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActiveDetailsCopy(
                            tickets: tickets2,
                          )));
            },
          ),
        );
      });
}

ListTile _tileissue(String issueName, String stationLocation,
    String issueCreationTime, String assigned) {
  return ListTile(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    title: Text(issueName,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
          fontSize: 18,
        )),
    subtitle: Text(stationLocation + "\n" + assigned,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          //color: Colors.grey[850],
          fontSize: 15,
        )),
    trailing: Text(issueCreationTime,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey[600],
          fontSize: 15,
        )),
    isThreeLine: true,
  );
}
