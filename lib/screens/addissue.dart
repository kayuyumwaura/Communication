//import 'package:image_picker/image_picker.dart';
//import 'package:saharadesk_dealer/screens/issues.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/model/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:saharadesk_dealer/screens/issues.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saharadesk_dealer/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Record Issue",
      debugShowCheckedModeBanner: false,
      home: AddIssue(tickets: tickets2),
    );
  }
}

class AddIssue extends StatefulWidget {
  final Tickets tickets;
  AddIssue({Key key, @required this.tickets}) : super(key: key);
  State<StatefulWidget> createState() => AddIssueState();
}

class AddIssueState extends State<AddIssue> {
  Future<IssuesCreate> postIssues;
  List<File> _files;
  FilePickerResult result;
  //Tickets tickets2;
  @override

  //description controller
  var commentsController = TextEditingController();
  clearTextInput1() {
    commentsController.clear();
  }

  var issueController = TextEditingController();
  clearTextInput0() {
    issueController.clear();
  }

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
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: Text(
            'Complete Job',
            style: TextStyle(color: Colors.white, fontSize: 18.0,),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: 420,
            //color: Color.fromRGBO(230, 230, 230, 10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                //first one
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //issue
                        SizedBox(height: 10.0),
                        Text(
                          'Job Card Number',
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
                                  controller: issueController,
                                  decoration:
                                      InputDecoration(hintText: 'Enter Job Card Number',
                                      
                                      ),
                                ),
                              ),
                              IconButton(
                                onPressed: clearTextInput0,
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.blueGrey,
                                  size: 16.0,
                                ),
                              )
                            ]),

                        //attach image
                        SizedBox(height: 20.0),
                        Text(
                          'Attach Job Card',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: (18),
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              //  child: _image == null
                              //  ? Text('No image selected')
                              //  : Image.file(_image),
                            ),
                            SizedBox(height: 10),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () => _getFilePath(),
                              tooltip: 'Pick File',
                              child: Icon(
                                Icons.attach_file,
                                color: Colors.redAccent,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
Divider(color: Colors.grey,),
                        //description
                        SizedBox(height: 20.0),
                        Text(
                          'Comments',
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
                                  controller: commentsController,
                                  decoration: InputDecoration(
                                      hintText: ('Enter Comments')),
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
                        
                        ////////////////////////////
                        Container(
                            padding:
                                EdgeInsets.all(70), //row container properties
                            // height: 120,
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  
                                  GestureDetector(
                                      onTap: () async {
                                        //pass dealer id here
                                        // SharedPreferences prefs =
                                        //     await SharedPreferences
                                        //         .getInstance();
                                        // var userid = prefs.getString('userid');

                                        //call api
                                        setState(() {
                      print("object" + (tickets2.id).toString() + commentsController.text );
                      RequestCompleteTicket().requestCompleteIssue(
                        tickets2.id, commentsController.text);
                    });
                                        // setState(() {
                                        //   postIssues = PostIssues().createIssue(
                                        //       userid.toString(),
                                        //       issueController.text,
                                        //       descriptionController.text);
                                        // });

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BottomNav()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 30.0, right: 30.0),
                                        height: 40.0,
                                        child: Material(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            shadowColor: Colors.redAccent,
                                            color: Colors.redAccent,
                                            elevation: 7.0,
                                            child: Center(
                                              child: Text('Save',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                      // fontWeight:
                                                      //     FontWeight.normal
                                                          )),
                                            )),
                                      )),
                                ]))
                      ]),
                )
              ],
            ),
          ),
        ));
  }

    void _getFilePath() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path)).toList();
      setState(() {
        this._files = [...?_files, ...?files];
      });
    } else {
      // User canceled the picker
    }
  }
}
