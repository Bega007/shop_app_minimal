import 'package:flutter/material.dart';

class MyCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(0, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondfirstCurve = Offset(0, size.height - 20);
    final secondlastCurve = Offset(0, size.height - 20);
    path.quadraticBezierTo(secondfirstCurve.dx, secondfirstCurve.dy,
        secondlastCurve.dx, secondlastCurve.dy);

    final thirdfirstCurve = Offset(0, size.height - 20);
    final thirdlastCurve = Offset(0, size.height - 20);
    path.quadraticBezierTo(thirdfirstCurve.dx, thirdfirstCurve.dy,
        thirdlastCurve.dx, thirdlastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
