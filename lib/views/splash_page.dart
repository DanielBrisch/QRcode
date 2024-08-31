import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/views/login/login_selection_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _LoginAppPage();
}

class _LoginAppPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginSelectionPage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: ColorUtils().purple,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorUtils().purple,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_outlined,
                      size: screenSize.aspectRatio * 200,
                      color: ColorUtils().white,
                    ),
                    Text(
                      'QRcode',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: ColorUtils().white,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      'storage',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: ColorUtils().white,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'version 1.0',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: ColorUtils().white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
