import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final Color buttonColor;
  final String label;
  final Color colorLabel;
  final Function onPressed;
  final BorderSide? borderSide;

  const LoginButton({
    super.key,
    required this.buttonColor,
    required this.label,
    required this.onPressed,
    required this.colorLabel,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.maxFinite,
      height: screenSize.height * 0.06,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: borderSide ??
                  BorderSide(
                    color: Colors.transparent,
                  ),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            buttonColor,
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: screenSize.aspectRatio * 40,
            fontWeight: FontWeight.w500,
            color: colorLabel,
          ),
        ),
      ),
    );
  }
}
