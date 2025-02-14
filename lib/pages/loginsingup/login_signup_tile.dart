import 'package:flutter/material.dart';
import 'package:reading_arabic/utils/margins.dart';
import 'package:reading_arabic/widgets/login_signup_button.dart';

class LoginSignupTile extends StatelessWidget {
  const LoginSignupTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Margins.vertical220,
        Text(
          'Sign in',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Color(0XFF4D4D4D),
          ),
        ),
        Margins.vertical14,
        Text(
          'Start your journey to mastering Arabic!',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Montserrat',
            fontSize: 12,
          ),
        ),
        Margins.vertical16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF929292),
                )),
              ),
              Margins.vertical32,
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ImageIcon(
                    AssetImage('assets/images/lock_icon.png'),
                    color: Color(0xFF929292),
                  ),
                )),
              ),
              Margins.vertical32,
              LoginSignupButton(),
            ],
          )),
        ),
        Margins.vertical56,
        Text(
          'Forgot password?',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: Color(0XFF4D4D4D),
          ),
        ),
        Margins.vertical8,
        Row(
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
        )
      ],
    );
  }
}
