import 'package:flutter/material.dart';

// class LogoName {
//   const LogoName({required this.x, required this.y, required this.logoNumber});

//   final double x;
//   final double y;
//   final int logoNumber;

//   Widget getLogoImg() {
//     return Align(
//       alignment: Alignment(0, 0),
//       child: Container(
//         height: 100,
//         color: Colors.black,
//         child: Image.asset(
//           'assets/images/logo_$logoNumber.png',
//           height: 70,
//         ),
//       ),
//     );
//   }
// }

class LogoName extends StatelessWidget {
  const LogoName({super.key, required this.x, required this.y, this.logoColor});

  final double x;
  final double y;
  final Color? logoColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 5; i++) ...[
          Align(
            alignment: Alignment(x, y),
            child: Image.asset(
              'assets/images/logo/logo_$i.png',
              height: 70,
              color: () {
                if (i == 1) {
                  return logoColor;
                }

                return null;
              }(),
            ),
          ),
        ]
      ],
    );
  }
}
