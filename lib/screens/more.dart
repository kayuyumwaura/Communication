import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/screens/profile.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "More Options",
      debugShowCheckedModeBanner: false,
      home: More(),
    );
  }
}

class More extends StatefulWidget {
  State<StatefulWidget> createState() => MoreState();
}

class MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
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
          //backgroundColor: Color.fromRGBO(230, 230, 230, 10.0),
          title: Text('More Options', style: TextStyle(color: Colors.white)),
          //actions: [IconButton(icon: Icon(Icons.notifications_none, color: Colors.blueGrey[900],), onPressed: (){})],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              //color: Color.fromRGBO(242, 242, 242, 1),
              width: double.infinity,
              height: 70,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  child: new Image.asset('assets/saharadesk.png'),
                  radius: 30.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Tovuti Group",
            style: TextStyle(
                fontSize: 25.0,
                //color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Contracting Company",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),

          // profile Profile
          SizedBox(height: 10),
          new GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // icon
                            Icon(
                              Icons.perm_identity,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ), // space
                            // text
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),

                        // tailing icon
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.redAccent,
                            size: 11,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // password
          SizedBox(height: 10),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // icon
                            Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ), // space
                            // text
                            Text(
                              'Change Password',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),

                        // tailing icon
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.redAccent,
                            size: 11,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // logout
          SizedBox(height: 10),
          new GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // icon
                            Icon(
                              Icons.logout,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ), // space
                            // text
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        // tailing icon
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.redAccent,
                            size: 11,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}
