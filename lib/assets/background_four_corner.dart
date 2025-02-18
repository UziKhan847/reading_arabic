import 'package:flutter/material.dart';
import 'package:reading_arabic/utils/corner_custom_clipper.dart';

class BackgroundFourCorner extends StatelessWidget {
  const BackgroundFourCorner({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    required this.colors,
  });

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: CornerCustomClipper(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < 3; i++) ...[
            Positioned(
              bottom: -39,
              right: -56,
              left: -56,
              child: switch (i) {
                1 => ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: colors,
                    ).createShader(bounds),
                    blendMode: BlendMode.srcATop,
                    child: Image.asset(
                      'assets/images/corner/four_corners_$i.png',
                    ),
                  ),
                _ => Image.asset(
                    'assets/images/corner/four_corners_$i.png',
                  )
              },
            ),
          ]
        ],
      ),
    );
  }
}
