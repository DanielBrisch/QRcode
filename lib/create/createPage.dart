import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qrcode/appBar/mainAppBar.dart';
import 'package:qrcode/create/ContainerCreateQRcode.dart';

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
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white,),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {

            },
          ),
          const SizedBox(width: 30)
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                      height: size.height / 2.3,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  child: Column(
                    children: [
                      const ContainerCreateQRcode(),
                      const SizedBox(height: 20),
                      const Text('To create a QR code, you need to scan'),
                      const Text('or add barcodes from already scanned'),
                      Padding(padding: EdgeInsets.only(top: size.width * 0.2),
                      child: const MainAppBar())
                    ],
                  ),
                ),
                // const Positioned(
                //   top: 100, 
                //     child: MainAppBar(),
                //   )
              ],
            ),
        ],
        ),
      ),
    );
  }
}
