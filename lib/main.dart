import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saharadesk_dealer/controller/controller.dart';
import 'package:saharadesk_dealer/screens/home.dart';
import 'package:saharadesk_dealer/screens/issues.dart';
//import 'package:saharadesk_dealer/screens/issues.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //email controller
  var emailController = TextEditingController();
  clearTextInput0() {
    emailController.clear();
  }

  //password controller
  var passwordController = TextEditingController();
  clearTextInput1() {
    passwordController.clear();
  }

  int userid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      //padding: EdgeInsets.only(top: 180.0, left: 20.0, right: 20.0),
                      child: new Image.asset('assets/saharadesk.png'),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'Roboto',
                                  fontSize: 17.0,
                                  //fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please enter your email';
                                }
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'Roboto',
                                  fontSize: 17.0,
                                  //fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ),
                          /* Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: InkWell(
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 17.0),
                                  ),
                                ),
                              )
                            ],
                          ),*/
                          SizedBox(height: 30),
                          GestureDetector(
                              onTap: () async {
                                userid = await TechnicianLogin()
                                    .technicianLogin(emailController.text,
                                        passwordController.text);
                                print(userid);

                                if (userid != 0) {
                                  //after the login REST api call && response code ==200
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('userid', userid.toString());

                                  print(userid.toString() + "if");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNav()));
                                } else {
                                  print(userid.toString() + "else");
                                  return showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Login"),
                                    content: Text("Please enter valid credentials"),
                                    actions: <Widget>[
                                      // ignore: deprecated_member_use
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text("Okay", style: TextStyle(color: Colors.redAccent),),
                                      ),
                                    ],
                                  ),
                                  );
                            
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Login()));
                                }
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                height: 40.0,
                                child: Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.redAccent,
                                    elevation: 7.0,
                                    child: Center(
                                      child: Text('Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            // fontWeight: FontWeight.normal
                                          )),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        /*Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to Sahara Desk?',
                style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
              ),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => issues()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18.0,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        )*/
      ],
    ));
  }
}
