// import 'package:flutter/material.dart';

// class BackgroundCorner {
//   BackgroundCorner({required this.colors, required this.constraints});

//   final BoxConstraints constraints;
//   final List<Color> colors;

//   SizedOverflowBox getBackgroundCorner() {
//     return SizedOverflowBox(
//         size: Size(constraints.maxWidth, constraints.maxHeight),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             for (int i = 0; i < 3; i++) ...[
//               switch (i) {
//                 1 => ShaderMask(
//                     shaderCallback: (bounds) => LinearGradient(
//                       begin: Alignment.centerRight,
//                       end: Alignment.centerLeft,
//                       colors: colors,
//                     ).createShader(bounds),
//                     blendMode: BlendMode.srcATop,
//                     child: Image.asset(
//                       'assets/images/corner/four_corners_$i.png',
//                       height: constraints.maxHeight,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 _ => Image.asset(
//                     'assets/images/corner/four_corners_$i.png',
//                     height: constraints.maxHeight,
//                     fit: BoxFit.cover,
//                   )
//               },
//             ]
//           ],
//         ));
//   }
// }

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
    return Positioned(
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
          child: Stack(
            children: [
              for (int i = 0; i < 3; i++) ...[
                switch (i) {
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
                }
              ]
            ],
          ),
        ),
      ),
    );
  }
}
