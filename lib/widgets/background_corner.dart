import 'package:flutter/material.dart';

class BackgroundCorner extends StatelessWidget {
  const BackgroundCorner(
      {super.key,
      this.top,
      this.bottom,
      this.right,
      this.left,
      this.flipX = false,
      this.flipY = false});

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final bool flipX;
  final bool flipY;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: 280,
        height: 280,
        top: top,
        bottom: bottom,
        right: right,
        left: left,
        child: Transform.flip(
          flipX: flipX,
          flipY: flipY,
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/app_corner_border_green.png')))),
        ));
  }
}
