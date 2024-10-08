import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/utils/color_utils.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPage();
}

class _SendPage extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ColorUtils().white,
        ),
      ),
    );
  }
}
