import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String id = 'login';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter curves',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(),
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
    return Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child:
            Stack(children: <Widget>[
      Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 16,
                MediaQuery.of(context).size.height / 10,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 5),
            decoration: BoxDecoration(),
            child:ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(children: [
                  Text('Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          color: Colors.indigo)),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Already have an account?"),
                    FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        suffixIcon: Icon(Icons.contacts, color: Colors.blue))),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.lock_outline, color: Colors.blue))),
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
                    FlatButton(
                      child: Text('Forgot password?'),
                    )
                  ],
                ),
                Center(
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
                    child: Text('LOGIN',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ],
            ),
      ),
      HeaderImage(),
    ]),
          
        ));
  }
}

//this is where the  bezier curve is created

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xff2962ff),
              Colors.orange.shade100,
              Color(0xff2962ff),
              Colors.grey.shade500,
              Color(0xff2962ff)
            ])),
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    path.lineTo(size.width - (size.width / 20), size.height);

    var secondControlPoint =
        Offset(size.width - (size.width / 6), size.height - (size.height / 12));
    var secondEndPoint = Offset(
        size.width - (size.width / 2.4), size.height - (size.height / 15));
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(
        size.width - (size.width / 5) * 3, size.height - (size.height / 15));
    var firstControlPoint = Offset(
        size.width - (size.width / 5) * 4.7, size.height - (size.height / 11));
    var firstEndPoint = Offset(0.0, (size.height / 3.7) * 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(0.0, (size.height / 3.7) * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
