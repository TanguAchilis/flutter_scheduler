import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/loginPage.dart';
import 'package:my_schedular/Pages/signUpPage.dart';
import 'package:my_schedular/components/bottomClipPath.dart';
import 'package:my_schedular/components/passwordField.dart';

class SelectLoginSignUp extends StatelessWidget {
  static String id = 'selectLoginOrSignUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectLoginSignUpPage(),
    );
  }
}

class SelectLoginSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(tag: 'clipcontainer', child: ClipedContainer()),
        Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text('Welcome to Scheduler',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'FasterOne',
                        color: Color(0xff2962ff),
                        fontSize: 35)),
              ),
              Hero(
                tag: 'login',
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontFamily: 'Cookie',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  color: Colors.blue,
                  hoverColor: Color(0xff2962ff),
                  hoverElevation: 5,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
              ),
              Hero(
                tag: 'signup',
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Cookie',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  color: Colors.blue,
                  hoverColor: Color(0xff2962ff),
                  hoverElevation: 5,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    Navigator.pushNamed(context, SignUP.id);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
