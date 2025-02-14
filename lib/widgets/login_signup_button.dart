import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 52,
        decoration: BoxDecoration(
          color: Color(0xFF1b7369),
          borderRadius: BorderRadius.circular(14),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          splashColor: Color(0xFFAE8B2D),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
          ),
        ),
      ),
    );
  }
}
