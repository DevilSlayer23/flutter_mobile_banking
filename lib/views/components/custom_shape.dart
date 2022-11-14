import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = size.height / 2;

    var path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(0, curveHeight, curveHeight, curveHeight)
      ..lineTo(size.width - curveHeight, curveHeight)
      ..quadraticBezierTo(size.width, curveHeight, size.width, size.height)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this != oldClipper;
  }
}
