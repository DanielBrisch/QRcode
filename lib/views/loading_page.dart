import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/utils/color_utils.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: ColorUtils().white,
      body: SafeArea(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
              color: ColorUtils().purple,
            ),
          ),
        ),
      ),
    );
  }
}
