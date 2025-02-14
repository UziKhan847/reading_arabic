import 'package:flutter/material.dart';
import 'package:reading_arabic/pages/loginsingup/login_signup_tile.dart';
import 'package:reading_arabic/widgets/background_corner.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage(this.constraints, {super.key});

  final BoxConstraints constraints;

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (_, constraints) {
        return Stack(
          children: [
            //background
            Positioned(
              right:
                  controller.hasClients ? -30 + (controller.offset / 6) : -30,
              child: SizedOverflowBox(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                child: Image(
                  image: AssetImage('assets/images/app_background.png'),
                  fit: BoxFit.cover,
                  height: constraints.maxHeight,
                ),
              ),
            ),
            //logo
            Positioned(
                left: constraints.maxWidth / 4,
                top: 120,
                child: Opacity(
                  opacity: controller.hasClients
                      ? ((controller.offset / 360) - 1).abs()
                      : 1,
                  child: Image.asset(
                    'assets/images/logo_name.png',
                    height: 70,
                  ),
                )),
            Positioned(
                left: constraints.maxWidth / 4,
                top: 120,
                child: Opacity(
                  opacity: controller.hasClients ? controller.offset / 360 : 0,
                  child: Image.asset(
                    'assets/images/logo_name_2.png',
                    height: 70,
                  ),
                )),


                
            PageView(
              controller: controller,
              children: [
                LoginSignupTile(),
                LoginSignupTile(),
              ],
            ),
            BackgroundCorner(top: -45, right: -58),
            BackgroundCorner(top: -45, left: -58, flipX: true),
            BackgroundCorner(bottom: -45, right: -58, flipY: true),
            BackgroundCorner(bottom: -45, left: -58, flipX: true, flipY: true),
          ],
        );
      }),
    );
  }
}
