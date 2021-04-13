

//import 'package:image_picker/image_picker.dart';
//import 'package:saharadesk_dealer/screens/issues.dart';
import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:saharadesk_dealer/screens/issues.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"Record Issue",
      debugShowCheckedModeBanner: false,
      home: PendingClosure(ticketsA: ticketspending,),
    );
  }
}

class PendingClosure extends StatefulWidget{
  final Tickets ticketsA;
  PendingClosure({Key key, @required this.ticketsA}) : super(key: key);

State<StatefulWidget> createState()=>PendingClosureState();
}

class PendingClosureState extends State<PendingClosure>{

  //description controller
  var descriptionController = TextEditingController();
  clearTextInput1() {
    descriptionController.clear();
  }

  Future<IssuesCreate> postIssues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 0,
        title: Text(
          'Close Issues',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[ 
        new IconButton( icon: new Icon(Icons.save_rounded), onPressed: () {
                Navigator.pop(context);
            }, ),],
      ),
      body: SingleChildScrollView(
        child: Container(
        width: 420,
        //color: Color.fromRGBO(230, 230, 230, 10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            //first one
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[ 
                        //description
                            SizedBox(height: 20.0),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: (18),
                              color: Colors.blueGrey),
                        ),
                        new Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  keyboardType: TextInputType.multiline,
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                      hintText: ('Comments on Job Done')),
                                ),
                              ),
                              IconButton(
                                onPressed: clearTextInput1,
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.blueGrey,
                                  size: 16.0,
                                ),
                              )
                            ]),

                          Container(
                  padding: EdgeInsets.all(30), //row container properties
                  // height: 120,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: 
                                  () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                issues()));
                                                //call api
                                                setState(() {
                              CloseIssue().closeIssue(ticketspending.id);
                            });
                                  },
                        child:Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.redAccent,
                              elevation: 7.0,
                                  child: Center(
                                    child: Text('Save',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19.0,
                                            fontWeight: FontWeight.normal)),
                                  )),
                            )),

                        // RaisedButton(
                        //   child: Text(
                        //     "Save",
                        //     style: TextStyle(color: Colors.white, fontSize: 16),
                        //   ),
                        //   hoverColor: Colors.white,
                        //   color: Colors.redAccent,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(17.0),
                        //       side: BorderSide(color: Colors.red)),
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        //   onPressed: () {
                        //     Navigator.push(
                        //               context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         issues()));
                        //     setState(() {
                        //       CloseIssue().closeIssue(ticketspending.id);
                        //     });
                        //   },
                        // ),
                      ]))
                        
                      ]
              ),
            )
          ],
        ),
      ),)
    );
  }
}

