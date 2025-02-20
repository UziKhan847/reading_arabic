import 'package:flutter/material.dart';

class CornerCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    // path.moveTo(0, 0);
    // path.lineTo(28, 40);
    // path.lineTo(75, 50);
    // path.lineTo(105, 87);
    // path.lineTo(166, 93);
    // path.lineTo(177, 156);
    // path.lineTo(220, 185);
    // path.lineTo(230, 227);
    // path.lineTo(w, h);
    // path.lineTo(w, 0);
    path.moveTo(0, 0);
    path.lineTo(w / 2, 0);
    path.lineTo(0, 155);

    path.moveTo(w, 0);
    path.lineTo(w / 2, 0);
    path.lineTo(w, 155);

    path.moveTo(0, h);
    path.lineTo(w / 2, h);
    path.lineTo(0, h - 155);

    path.moveTo(w, h);
    path.lineTo(w / 2, h);
    path.lineTo(w, h - 155);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
