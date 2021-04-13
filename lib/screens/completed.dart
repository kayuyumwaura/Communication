import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:saharadesk_dealer/screens/activedetailscopy.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Completed",
      debugShowCheckedModeBanner: false,
      home: Completed(),
    );
  }
}

class Completed extends StatefulWidget {
  State<StatefulWidget> createState() => CompletedState();
}

class CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.arrow_back_ios),
        //       onPressed: () {
        //         Navigator.pop(context);
        //     },);
        //   }
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          'Completed',
          style: TextStyle(color: Colors.white),
        ),
        // actions: <Widget>[
        // new IconButton( icon: new Icon(Icons.save_rounded), onPressed: () {
        //         Navigator.pop(context);
        //     }, ),],
      ),
      body: Container(
        color: Colors.transparent,
        child: _issuesDataCompleted(),
      ),
    );
  }
}

FutureBuilder _issuesDataCompleted() {
  return FutureBuilder<List<Tickets>>(
    future: GetTicketsClosed().getIssues(),
    builder: (BuildContext context, AsyncSnapshot<List<Tickets>> snapshot) {
      if (snapshot.hasData) {
        List<Tickets> data = snapshot.data;
        return _issues(data);
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

Tickets tickets2;
ListView _issues(data) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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
          fontSize: 15,
        )),
    isThreeLine: true,
  );
}
