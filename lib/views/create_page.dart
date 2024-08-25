import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Create',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: ColorUtils().white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 30)
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height / 2.3,
                          color: Colors.deepPurple,
                        ),
                        Container(
                          height: size.height / 2,
                          color: ColorUtils().white,
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height * 0.05,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      child: const Column(
                        children: [
                          ContainerCreateQRcode(),
                          SizedBox(height: 20),
                          Text('To create a QR code, you need to scan'),
                          Text('or add barcodes from already scanned'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(),
            ),
          ),
        ],
      ),
    );
  }
}
