import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({super.key, this.onTap, required this.colors});

  final void Function()? onTap;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        //borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: 52,
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
            child: Center(
              child: Align(
                alignment: Alignment(-1.2, 0),
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
        ),
      ),
    );
  }
}
