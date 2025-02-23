import 'package:flutter/material.dart';
import 'package:reading_arabic/assets/background_corner.dart';
import 'package:reading_arabic/assets/logo_name.dart';
import 'package:reading_arabic/utils/margins.dart';
import 'package:reading_arabic/widgets/login_signup_button.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage(this.screenSize, {super.key});

  final Size screenSize;

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with TickerProviderStateMixin {
  late List<AnimationController> gradAnimController;
  late List<Animation<double>> gradAnim;

  // late AnimationController btnTextAnimController;
  // late Animation<double> btnTextSizeAnimation;
  // late Animation<double> btnTextFadeAnimation;
  // bool _textChanged = false;

  late AnimationController swipeAnimController;
  late Animation<double> swipeAnim;

  bool isLogin = true;

  @override
  void initState() {
    super.initState();

    //Gradient Animation
    gradAnimController = List<AnimationController>.generate(
      2,
      (_) => AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
      growable: false,
    );

    gradAnim = List<Animation<double>>.generate(
        2,
        (int index) =>
            Tween<double>(begin: 0, end: 1).animate(gradAnimController[index]
              ..addListener(() {
                setState(() {});
              })));

    //Swipe Animation
    swipeAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    swipeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: swipeAnimController,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    for (AnimationController e in gradAnimController) {
      e.dispose();
    }

    swipeAnimController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final orientation = MediaQuery.of(context).orientation;

    List<Color> gradientColors = [
      Color.lerp(Color(0xFF1d7569), Color(0xFF053b6d), gradAnim[0].value)!,
      Color.lerp(Color(0xFF1d7569), Color(0xFF053b6d), gradAnim[1].value)!
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //background
          Positioned(
            right: -15 + swipeAnim.value * 30,
            child: RotatedBox(
              quarterTurns: 0,
              child: SizedOverflowBox(
                size: Size(widget.screenSize.width, widget.screenSize.height),
                child: Image(
                  image: AssetImage('assets/images/app_background.png'),
                  fit: BoxFit.cover,
                  height: widget.screenSize.height,
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //LOGO
              LogoName(
                x: 0,
                y: -0.7,
                height: 75,
                colors: gradientColors,
              ),
              Margins.vertical20,

              //SIGN IN
              SizedBox(
                child: Stack(children: [
                  if (swipeAnim.value < 0.6)
                    Align(
                      alignment: Alignment(-swipeAnim.value * 5, 0),
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

                  //SIGN UP
                  if (swipeAnim.value > 0.4)
                    Align(
                      alignment: Alignment(5 - swipeAnim.value * 5, 0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Color(0XFF4D4D4D),
                        ),
                      ),
                    ),
                ]),
              ),
              Margins.vertical8,

              //TEXT
              Align(
                alignment: Alignment(0, -0.33),
                child: Text(
                  'Start your journey to mastering Arabic!',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                  ),
                ),
              ),
              Margins.vertical30,

              //EMAIL
              SizedBox(
                height: 56,
                width: 325,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xFF929292),
                  )),
                ),
              ),
              Margins.vertical32,

              //PASSWORD
              SizedBox(
                height: 56,
                width: 325,
                child: TextField(
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
              Margins.vertical32,

              //REPASSWORD
              SizedBox(
                height: 56,
                width: 325,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //LOGIN SINGUP BUTTON
                    if (swipeAnim.value < 0.6)
                      Positioned(
                        right: swipeAnim.value * 800,
                        child: LoginSignupButton(
                          height: 56,
                          width: 325,
                          xAxisLogin: 0 - swipeAnim.value * 10,
                          xAxisSigup: 10 - swipeAnim.value * 10,
                          onTap: () {},
                          colors: gradientColors,
                        ),
                      ),

                    //REPASSWORD
                    if (swipeAnim.value > 0.4)
                      Positioned(
                        left: 800 - (swipeAnim.value * 800),
                        child: SizedBox(
                          height: 56,
                          width: 325,
                          child: TextField(
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
                  ],
                ),
              ),
              Margins.vertical32,

              //SIGN UP BUTTON
              swipeAnim.value == 0
                  ? SizedBox(
                      height: 56,
                    )
                  : Align(
                      alignment: Alignment(25 - swipeAnim.value * 25, 0),
                      child: LoginSignupButton(
                        height: 56,
                        width: 325,
                        xAxisLogin: 0 - swipeAnim.value * 10,
                        xAxisSigup: 10 - swipeAnim.value * 10,
                        onTap: () {},
                        colors: gradientColors,
                      ),
                    ),

              Margins.vertical18,

              AnimatedSwitcher(duration: Duration(microseconds: 10000)),

              //FORGOT PASSWORD
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    if (swipeAnim.value < 1)
                      Align(
                        alignment: Alignment(0 - swipeAnim.value * 4, -1),
                        child: Text(
                          'Forgot password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF4D4D4D),
                          ),
                        ),
                      ),

                    //MEMBER QUESTION
                    if (swipeAnim.value < 1)
                      Align(
                        alignment: Alignment(0 - swipeAnim.value * 30, 1),
                        child: SizedBox(
                          width: 325,
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
                                  if (gradAnim[1].isCompleted) {
                                    swipeAnimController.reverse();
                                    await gradAnimController[1].reverse();
                                    await gradAnimController[0].reverse();
                                    isLogin = !isLogin;
                                  } else {
                                    isLogin = !isLogin;
                                    setState(() {});
                                    await Future.delayed(
                                        Duration(milliseconds: 300));
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
                      ),

                    if (swipeAnim.value > 0)
                      //MEMBER QUESTION 2
                      Align(
                        alignment: Alignment(30 - swipeAnim.value * 30, 0),
                        child: SizedBox(
                          width: 325,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already a member? ',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF4D4D4D),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (gradAnim[1].isCompleted) {
                                    swipeAnimController.reverse();
                                    await gradAnimController[1].reverse();
                                    await gradAnimController[0].reverse();
                                    isLogin = !isLogin;
                                  } else {
                                    isLogin = !isLogin;
                                    setState(() {});
                                    await Future.delayed(
                                        Duration(milliseconds: 300));
                                    swipeAnimController.forward();
                                    await gradAnimController[0].forward();
                                    gradAnimController[1].forward();
                                  }
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFAE8B2D)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          BackgroundCorner(
            top: -38,
            right: -58,
            colors: gradientColors,
          ),
          BackgroundCorner(
              top: -38, left: -58, flipX: true, colors: gradientColors),
          BackgroundCorner(
              bottom: -38, right: -58, flipY: true, colors: gradientColors),
          BackgroundCorner(
              bottom: -38,
              left: -58,
              flipX: true,
              flipY: true,
              colors: gradientColors),
        ],
      ),
    );
  }
}






            // Positioned(
            //     child: ClipPath(
            //   clipBehavior: Clip.hardEdge,
            //   clipper: CornerCustomClipper(),
            //   child: Container(
            //     color: Colors.blue.withAlpha(160),
            //   ),
            // )),

            // ClipPath(
            //   clipBehavior: Clip.hardEdge,
            //   clipper: CornerCustomClipper(),
            //   child: BackgroundCorner(
            //           colors: gradientColors, constraints: constraints)
            //       .getBackgroundCorner(),
            // ),





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



            //  SizedBox(
            //     height: 144,
            //     width: 325,
            //     child: Stack(
            //       clipBehavior: Clip.none,
            //       children: [
            //         Positioned(
            //           left: 800 - (swipeAnim.value * 800),
            //           child: SizedBox(
            //             height: 56,
            //             width: 325,
            //             child: TextField(
            //               decoration: InputDecoration(
            //                   prefixIcon: Padding(
            //                 padding: const EdgeInsets.all(12.0),
            //                 child: ImageIcon(
            //                   AssetImage('assets/icons/lock_icon.png'),
            //                   color: Color(0xFF929292),
            //                 ),
            //               )),
            //             ),
            //           ),
            //         ),

            //         //LOGIN SINGUP BUTTON
            //         AnimatedAlign(
            //           duration: Duration(milliseconds: 100),
            //           curve: Curves.easeInBack,
            //           alignment: isLogin
            //               ? Alignment.topCenter
            //               : Alignment.bottomCenter,
            //           child: LoginSignupButton(
            //             height: 56,
            //             width: 325,
            //             xAxisLogin: 0 - swipeAnim.value * 10,
            //             xAxisSigup: 10 - swipeAnim.value * 10,
            //             onTap: () {},
            //             colors: gradientColors,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),