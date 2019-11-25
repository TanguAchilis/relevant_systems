import 'package:flutter/material.dart';
import 'dart:ui';

//this is the top path of the main page
class TriangularPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,
      //  decoration: BoxDecoration(color: Color.fromRGBO(236, 154, 156, 1)),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
      clipper: TriangularPathWaveClipper(),
    );
  }
}

class SemiTriangularPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
      clipper: SemiTriangularPathWaveClipper(),
    );
  }
}

class TopThinTriangularPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFF336BFA)),
      ),
      clipper: TopThinTriangularWaveClipper(),
    );
  }
}

class BottomThinTriangularPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFF336BFA)),
      ),
      clipper: BottomThinTriangularPathWaveClipper(),
    );
  }
}

//section for the paths
class TriangularPathWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width / 1.16, 0.0);

    //first quadratic curve
    var firstControlPoint = Offset(size.width, size.height / 12);
    var firstEndPoint = Offset(size.width / 1.18, size.height / 6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    //second quadratic curve
    var secondControlPoint = Offset(size.width / 8, size.height / 1.5);
    var secondEndPoint = Offset(0.0, size.height / 1.48);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0.0, size.height / 1.5);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SemiTriangularPathWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 1.5, size.height);

    var firstControlPoint = Offset(size.width / 1.7, size.height / 1.04);
    var firstEndPoint = Offset(size.width / 1.55, size.height / 1.08);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width / 1.2, size.height / 1.25);

    var secondControlPoint = Offset(size.width / 1.1, size.height / 1.3);
    var secondEndPoint = Offset(size.width, size.height / 1.17);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 1.5, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TopThinTriangularWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 1.6, 0.0);
    path.lineTo(size.width / 1.45, 0.0);

    path.lineTo(size.width / 1.19, size.height / 21);

    var firstControlPoint = Offset(size.width / 1.16, size.height / 18);
    var firstEndPoint = Offset(size.width / 1.13, size.height / 21);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    //path.lineTo(size.width/1.15, size.height/12);

    path.lineTo(size.width / 1.06, 0.0);
    path.lineTo(size.width / 1.01, 0.0);

    path.lineTo(size.width / 1.11, size.height / 16);

    var secondControlPoint = Offset(size.width / 1.16, size.height / 13);
    var secondEndPoint = Offset(size.width / 1.22, size.height / 16);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width/1.25, size.height/10);

    path.lineTo(size.width / 1.6, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomThinTriangularPathWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height / 1.4);
    path.lineTo(size.width, size.height / 1.3);

    path.lineTo(size.width / 1.12, size.height / 1.18);

    var firstControlPoint = Offset(size.width / 1.17, size.height / 1.14);
    var firstEndPoint = Offset(size.width / 1.105, size.height / 1.1);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    //path.lineTo(size.width / 1.14, size.height / 1.1);

    path.lineTo(size.width, size.height / 1.04);
    path.lineTo(size.width, size.height / 1.07);

//returnx path
    path.lineTo(size.width / 1.08, size.height / 1.125);
    var secondControlPoint = Offset(size.width / 1.1, size.height / 1.14);
    var secondEndPoint = Offset(size.width / 1.08, size.height / 1.165);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    //path.lineTo(size.width / 1.1, size.height / 1.16);

    path.lineTo(size.width, size.height / 1.25);
    path.lineTo(size.width, size.height / 1.4);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
