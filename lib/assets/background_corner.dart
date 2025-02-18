import 'package:flutter/material.dart';
import 'package:reading_arabic/utils/corner_custom_clipper.dart';

class BackgroundCorner extends StatelessWidget {
  const BackgroundCorner(
      {super.key,
      this.top,
      this.bottom,
      this.right,
      this.left,
      required this.colors,
      this.flipX = false,
      this.flipY = false});

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final bool flipX;
  final bool flipY;
  final List<Color> colors;

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
                child: switch (i) {
                  1 => ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: colors,
                      ).createShader(bounds),
                      blendMode: BlendMode.srcATop,
                      child: Image.asset(
                        'assets/images/corner/corner_$i.png',
                      ),
                    ),
                  _ => Image.asset(
                      'assets/images/corner/corner_$i.png',
                    )
                },
              ),
            ),
          ),
        ]
      ],
    );
  }
}
