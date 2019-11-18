import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/loginPage.dart';
import 'package:my_schedular/components/bottomClipPath.dart';
import 'package:my_schedular/components/passwordField.dart';

class SignUP extends StatelessWidget {
  static String id = 'signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MySignUPPage(),
    );
  }
}

class MySignUPPage extends StatefulWidget {
  @override
  _MySignUPPageState createState() => _MySignUPPageState();
}

class _MySignUPPageState extends State<MySignUPPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(tag:'clipcontainer',child: ClipedContainer()),
        SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 16,
                0,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 5.5),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //this is the first child which is a arrow for navigating
                SafeArea(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Sign Up',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Cookie',
                          fontSize: 50,
                          color: Colors.indigo),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Already have an account?"),
                    FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Cookie',
                            fontSize: 23),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Login.id);
                      },
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.contacts, color: Colors.blue)),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email, color: Colors.blue)),
                ),
                PasswordField(
                  labelText: 'Password',
                ),
                PasswordField(
                  labelText: 'Confirm Password',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Flexible(
                      child: FlatButton(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Cookie',
                              fontSize: 23),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Hero(tag: 'signup',
                                      child: RaisedButton(
                      elevation: 10,
                      focusColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                      onPressed: () {
                        print('login pressed');
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.accent,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
