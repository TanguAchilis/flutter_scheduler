import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/signUpPage.dart';
import 'package:my_schedular/components/bottomClipPath.dart';
import 'package:my_schedular/components/passwordField.dart';

class Login extends StatelessWidget {
  static String id = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyLoginPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Hero(tag:'clipcontainer',child: ClipedContainer()),
      SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 16,
              0,
              MediaQuery.of(context).size.width / 20,
              MediaQuery.of(context).size.height / 5),
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
              Row(children: [
                Text('Login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Cookie',
                        fontWeight: FontWeight.w800,
                        fontSize: 60,
                        color: Colors.indigo)),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Don't have an account?"),
                  Flexible(
                    child:  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUP.id);
                    },
                    child: Text(
                      'Create your account',
                      style:
                          TextStyle(color: Colors.red, fontFamily: 'Cookie', fontSize: 23),
                    ),
                  ),
                  ),
                 
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.contacts, color: Colors.blue))),
              PasswordField(
                labelText: 'Password',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        onChanged: (value) {
                          isChecked = value;
                          setState(() {});
                        },
                        checkColor: Colors.white,
                        activeColor: Color(0xff2962ff),
                        value: isChecked,
                      ),
                      Text("Keep me signed In?"),
                    ],
                  ),
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
                  ),
                ],
              ),
              Center(
                child: Hero(tag: 'login',
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
                    child: Text('Login',
                        style: TextStyle(
                            fontFamily: 'Cookie',
                            fontSize: 35,
                            fontWeight: FontWeight.bold),),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
