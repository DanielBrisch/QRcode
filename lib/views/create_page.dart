import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/utils/color_utils.dart';
import 'package:qrcode/widgets/container_create_qr_code.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils().purple,
        title: Text(
          'Create',
          style: GoogleFonts.roboto(
            fontSize: size.aspectRatio * 45,
            fontWeight: FontWeight.w400,
            color: ColorUtils().white,
          ),
        ),
        leading: BackButton(
          color: ColorUtils().white,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.home);
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: size.width * 0.07),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.info_outline,
                    color: ColorUtils().white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      Icon(Icons.settings_outlined, color: ColorUtils().white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerCreateQRcode(),
              Text('To create a QR code, you need to scan'),
              Text('or add barcodes from already scanned'),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomAppBar(),
    );
  }
}
