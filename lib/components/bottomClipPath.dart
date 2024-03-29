import 'package:flutter/material.dart';

class ClipedContainer extends StatelessWidget {
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

    // var firstControlPoint = Offset(35, 180);
    // var firstEndPoint = Offset(30, 120);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);

    // var secondControlPoint = Offset(35, 0);
    // var secondEndPoint = Offset(250, 45);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);

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
