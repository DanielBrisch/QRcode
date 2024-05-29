import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qrcode/create/createPage.dart';
import 'package:qrcode/home/buttonContainer.dart';
import 'package:qrcode/scan/scanPage.dart';
import 'package:qrcode/service/qrCodeService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(220, 226, 232, 1.0),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name != '/profile') {
                        Navigator.pushNamed(context, '/profile');
                        setState(() {
                          QRService.pageSelected = false;
                        });
                      }
                    },
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('lib/assets/img/happyguy.png'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daniel',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cibolli',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mobile developer',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8), right: Radius.circular(8)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.info_outline),
                            onPressed: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  '/info') {
                                Navigator.pushNamed(context, '/info');
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.settings_outlined),
                            onPressed: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  '/settings') {
                                Navigator.pushNamed(context, '/settings');
                                setState(() {
                                  QRService.pageSelected = true;
                                });
                              }
                            },
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 38, color: Colors.black),
                    ),
                    Text(
                      'to QRcode',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ],
                )),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  ContainerButton(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/create') {
                        Navigator.pushNamed(context, '/create');
                        setState(() {
                          QRService.allFalse();
                          QRService.createSelected = true;
                        });
                      }
                    },
                    colorCircle: Colors.deepPurple,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                    borderRadius: 20,
                    label: const Text(
                      'CREATE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ContainerButton(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/scan') {
                        Navigator.pushNamed(context, '/scan');
                        setState(() {
                          QRService.allFalse();
                          QRService.scanSelected = true;
                        });
                      }
                    },
                    icon: const Icon(Icons.qr_code_scanner_outlined,
                        color: Colors.white, size: 35),
                    colorCircle: Colors.redAccent,
                    borderRadius: 20,
                    label: const Text(
                      'SCAN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Row(
                children: [
                  ContainerButton(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/send') {
                        Navigator.pushNamed(context, '/send');
                        setState(() {
                          QRService.allFalse();
                          QRService.sendSelected = true;
                        });
                      }
                    },
                    icon: const Icon(Icons.mail_outlined,
                        color: Colors.white, size: 40),
                    colorCircle: Colors.yellow,
                    borderRadius: 20,
                    label: const Text(
                      'SEND',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ContainerButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.print_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    colorCircle: Colors.green,
                    borderRadius: 20,
                    label: const Text(
                      'PRINT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
              child: SizedBox(
                  width: 400,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (ModalRoute.of(context)!.settings.name != '/history') {
                        Navigator.pushNamed(context, '/history');
                        setState(() {
                          QRService.allFalse();
                          QRService.historySelected = true;
                        });
                      }
                    },
                    backgroundColor: Colors.deepPurple,
                    child: const Text(
                      'HISTORY',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
            ),
            const Spacer(),
            const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('2023 QRcode Limited All rights reserved',
                            style: TextStyle(color: Colors.grey)),
                        Text('Terms and Canditions',
                            style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
