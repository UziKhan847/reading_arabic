import 'package:flutter/material.dart';
import 'package:reading_arabic/assets/background_four_corner.dart';
import 'package:reading_arabic/assets/logo_name.dart';
import 'package:reading_arabic/widgets/login_signup_button.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage(this.constraints, {super.key});

  final BoxConstraints constraints;

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with TickerProviderStateMixin {
  late List<AnimationController> gradAnimController;
  late List<Animation<double>> gradAnim;

  late AnimationController btnAnimController;
  late Animation<double> btnAnim;

  // late AnimationController btnTextAnimController;
  // late Animation<double> btnTextSizeAnimation;
  // late Animation<double> btnTextFadeAnimation;
  // bool _textChanged = false;

  late AnimationController swipeAnimController;
  late Animation<double> swipeAnim;

  @override
  void initState() {
    super.initState();

    //Gradient Animation
    gradAnimController = List<AnimationController>.generate(
      2,
      (_) => AnimationController(
          vsync: this, duration: Duration(milliseconds: 600)),
      growable: false,
    );

    gradAnim = List<Animation<double>>.generate(
        2,
        (int index) =>
            Tween<double>(begin: 0, end: 1).animate(gradAnimController[index]
              ..addListener(() {
                setState(() {});
              })));

    //Button Animation
    btnAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    btnAnim = Tween<double>(begin: 0.0, end: 0.3).animate(CurvedAnimation(
      parent: btnAnimController,
      curve: Curves.easeInOutBack,
    ))
      ..addListener(() {
        setState(() {});
      });

    // //Button Text Animation
    // btnTextAnimController = AnimationController(
    //   duration: Duration(seconds: 1),
    //   vsync: this,
    // );

    // btnTextSizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(parent: btnTextAnimController, curve: Curves.easeInOut),
    // );

    // btnTextFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(parent: btnTextAnimController, curve: Curves.easeInOut),
    // );

    //Swipe Animation
    swipeAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    swipeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: swipeAnimController,
      curve: Curves.easeOutCirc,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    for (AnimationController e in gradAnimController) {
      e.dispose();
    }

    btnAnimController.dispose();
    swipeAnimController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundSwipeValue = swipeAnim.value * 60;

    List<Color> gradientColors = [
      Color.lerp(Color(0xFF1d7569), Color(0xFF053b6d), gradAnim[0].value)!,
      Color.lerp(Color(0xFF1d7569), Color(0xFF053b6d), gradAnim[1].value)!
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (_, constraints) {
        return Stack(
          children: [
            //background
            Positioned(
              right: -30 + backgroundSwipeValue,
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
              colors: gradientColors,
            ),

            Align(
              alignment: Alignment(-swipeAnim.value * 2, -0.38),
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
                      AssetImage('assets/icons/lock_icon.png'),
                      color: Color(0xFF929292),
                    ),
                  )),
                ),
              ),
            ),

            //Button for Login & Sign Up
            Align(
              alignment: Alignment(0, 0.39 + btnAnim.value),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: LoginSignupButton(
                  onTap: () {},
                  colors: gradientColors,
                ),
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
                  GestureDetector(
                    onTap: () async {
                      // toggleButtonAnimation = !toggleButtonAnimation;

                      // toggleAnimation = !toggleAnimation;

                      if (gradAnim[1].isCompleted) {
                        swipeAnimController.reverse();
                        await gradAnimController[1].reverse();
                        await gradAnimController[0].reverse();
                        btnAnimController.reverse();
                      } else {
                        await btnAnimController.forward();
                        swipeAnimController.forward();
                        await gradAnimController[0].forward();
                        gradAnimController[1].forward();
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFAE8B2D)),
                    ),
                  ),
                ],
              ),
            ),

            // Align(
            //     alignment: Alignment.center,
            //     child: ShaderMask(
            //       shaderCallback: (bounds) => LinearGradient(
            //         begin: Alignment.centerRight,
            //         end: Alignment.centerLeft,
            //         colors: gradientColors,
            //       ).createShader(bounds),
            //       blendMode: BlendMode.srcATop,
            //       child: Image.asset(
            //         'assets/images/corner/corner_1.png',
            //         width: 280,
            //       ),
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

            // Positioned(
            //     child: ClipPath(
            //   clipBehavior: Clip.hardEdge,
            //   clipper: CornerCustomClipper(),
            //   child: Container(
            //     color: Colors.blue.withAlpha(160),
            //   ),
            // )),

            // BackgroundCorner(
            //   top: -46,
            //   right: -58,
            //   colors: gradientColors,
            // ),
            // BackgroundCorner(
            //     top: -46, left: -58, flipX: true, colors: gradientColors),
            // BackgroundCorner(
            //     bottom: -46, right: -58, flipY: true, colors: gradientColors),
            // BackgroundCorner(
            //     bottom: -46,
            //     left: -58,
            //     flipX: true,
            //     flipY: true,
            //     colors: gradientColors),

            BackgroundFourCorner(
              colors: gradientColors,
            )
          ],
        );
      }),
    );
  }
}
