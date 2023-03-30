import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 4*size.height/5);
    Offset curvePoint1=Offset(size.width/8, size.height);
    Offset centerPoint1=Offset(2*size.width/8, 4*size.height/5);
    path.quadraticBezierTo(curvePoint1.dx, curvePoint1.dy,centerPoint1.dx, centerPoint1.dy);
    Offset curvePoint2=Offset(3*size.width/8, 3*size.height/5);
    Offset centerPoint2=Offset(4*size.width/8, 4*size.height/5);
    path.quadraticBezierTo(curvePoint2.dx, curvePoint2.dy,centerPoint2.dx, centerPoint2.dy);
    //path.quadraticBezierTo(curvePoint1.dx,curvePoint1.dy,100,200);

    Offset curvePoint3=Offset(5*size.width/8, size.height);
    Offset endPoint1=Offset(6*size.width/8, 4*size.height/5);
    path.quadraticBezierTo(curvePoint3.dx,curvePoint3.dy,endPoint1.dx,endPoint1.dy);
    Offset curvePoint4=Offset(7*size.width/8, 3*size.height/5);
    Offset endPoint2=Offset(size.width, 4*size.height/5);
    path.quadraticBezierTo(curvePoint4.dx,curvePoint4.dy,endPoint2.dx,endPoint2.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}