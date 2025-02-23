import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton(
      {super.key,
      this.onTap,
      required this.xAxisLogin,
      required this.xAxisSigup,
      required this.colors,
      this.height,
      this.width});

  final void Function()? onTap;
  final List<Color> colors;
  final double? height;
  final double? width;
  final double xAxisLogin;
  final double xAxisSigup;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        //borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: colors),
            //borderRadius: BorderRadius.circular(14),
          ),
          child: InkWell(
            onTap: onTap,
            //borderRadius: BorderRadius.circular(14),
            splashColor: Color(0xFFAE8B2D),
            child: Stack(children: [
              Align(
                alignment: Alignment(xAxisLogin, 0),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
              ),
              Align(
                alignment: Alignment(xAxisSigup, 0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
