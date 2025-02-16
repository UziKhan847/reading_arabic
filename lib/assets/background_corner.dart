import 'package:flutter/material.dart';
import 'package:reading_arabic/utils/corner_custom_clipper.dart';

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
    return Stack(
      children: [
        for (int i = 0; i < 3; i++) ...[
          Positioned(
            width: 280,
            top: top,
            bottom: bottom,
            right: right,
            left: left,
            child: Transform.flip(
              flipX: flipX,
              flipY: flipY,
              child: ClipPath(
                clipper: CornerCustomClipper(),
                child: Image.asset(
                  'assets/images/corner/corner_$i.png',
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
