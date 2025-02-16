import 'package:flutter/material.dart';
import 'package:reading_arabic/assets/logo_name.dart';
import 'package:reading_arabic/assets/background_corner.dart';
import 'package:reading_arabic/widgets/login_signup_button.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage(this.constraints, {super.key});

  final BoxConstraints constraints;

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animControllerSwipeColor;
  late Animation<double> animSwipeColor;

  @override
  void initState() {
    super.initState();

    animControllerSwipeColor = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animSwipeColor = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animControllerSwipeColor);
  }

  @override
  void dispose() {
    animControllerSwipeColor.dispose();
    super.dispose();
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
            LogoName(
              x: 0,
              y: -0.65,
            ),

            Align(
              alignment: Alignment(0, -0.38),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0XFF4D4D4D),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, -0.248),
              child: Text(
                'Start your journey to mastering Arabic!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, -0.11),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xFF929292),
                  )),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.142),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage('assets/images/lock_icon.png'),
                      color: Color(0xFF929292),
                    ),
                  )),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.39),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: LoginSignupButton(),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.622),
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF4D4D4D),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member yet? ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF4D4D4D),
                    ),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFAE8B2D)),
                  ),
                ],
              ),
            ),

            // Align(
            //     alignment: Alignment.center,
            //     child: Image.asset(
            //       'assets/images/corner_1.png',
            //       width: 280,
            //     )),

            // Align(
            //   alignment: Alignment.center,
            //   child: ClipPath(
            //     clipper: CornerCustomClipper(),
            //     child: Container(
            //       width: 280,
            //       height: 263.164,
            //       color: Colors.amberAccent.withAlpha(140),
            //     ),
            //   ),
            // ),

            BackgroundCorner(top: -46, right: -58),
            BackgroundCorner(top: -46, left: -58, flipX: true),
            BackgroundCorner(bottom: -46, right: -58, flipY: true),
            BackgroundCorner(bottom: -46, left: -58, flipX: true, flipY: true),
          ],
        );
      }),
    );
  }
}
