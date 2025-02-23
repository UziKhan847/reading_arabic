import 'package:flutter/material.dart';

class CornerCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    // final leftCornerH = h * 0.205;
    //final leftCornerW = w * 0.475;

    path.moveTo(0, 0);
    path.lineTo(28, 40);
    path.lineTo(75, 50);
    path.lineTo(105, 87);
    path.lineTo(166, 93);
    path.lineTo(177, 156);
    path.lineTo(220, 185);
    path.lineTo(230, 227);
    path.lineTo(w, h);
    path.lineTo(w, 0);

    // path.moveTo(0, 0);
    // path.lineTo(leftCornerW, 0);
    // path.lineTo(0, leftCornerH);

    // path.moveTo(w, 0);
    // path.lineTo(w - leftCornerW, 0);
    // path.lineTo(w, leftCornerH);

    // path.moveTo(0, h);
    // path.lineTo(leftCornerW, h);
    // path.lineTo(0, h - leftCornerH);

    // path.moveTo(w, h);
    // path.lineTo(w - leftCornerW, h);
    // path.lineTo(w, h - leftCornerH);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
