import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  double _zoomValue = 1.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scanAreaHeigth = MediaQuery.of(context).size.height * 0.4;
    var scanAreaWidth = MediaQuery.of(context).size.width * 0.8;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderLength: 80,
                    borderWidth: 5,
                    cutOutHeight: scanAreaHeigth,
                    cutOutWidth: scanAreaWidth),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 25),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  const SizedBox(width: 20),
                  const Text('Scan',
                      style: TextStyle(color: Colors.white, fontSize: 20))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            elevation: WidgetStateProperty.all(0),
                            shape: WidgetStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                              height: 50,
                              width: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.energy_savings_leaf_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Lite',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ))),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            elevation: WidgetStateProperty.all(0),
                            shape: WidgetStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                              height: 50,
                              width: 74,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.image_outlined,
                                      color: Colors.white),
                                  Text('Image scan',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ))),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            elevation: WidgetStateProperty.all(0),
                            shape: WidgetStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                              height: 50,
                              width: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline, color: Colors.white),
                                  Text(
                                    'Help',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )))
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: size.height * 0.770),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 320,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 4,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 12,
                                    ),
                                  ),
                                  child: Slider(
                                    activeColor: Colors.white,
                                    value: _zoomValue,
                                    min: 1.0,
                                    max: 4.0,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _zoomValue = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: -3,
                                child: Icon(Icons.zoom_in, color: Colors.white),
                              ),
                              const Positioned(
                                right: -3,
                                child:
                                    Icon(Icons.zoom_out, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
              left: size.width * 0.10,
              right: size.width * 0.10,
              top: size.height * 0.892,
              child: const BottomAppBar(),
            ),
          ]),
        ));
  }

  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    bool isShowingDialog = false;

    controller.scannedDataStream.listen((scanData) {
      if (!isShowingDialog) {
        setState(() {
          result = scanData;
          Uri uri = Uri.parse(result!.code!);
          isShowingDialog = true;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 38,
                  ),
                ),
                content: Text(
                  "URL: ${result!.code}",
                  style: const TextStyle(fontSize: 20),
                ),
                actions: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            isShowingDialog = false;
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            launchUrl(uri);
                            isShowingDialog = false;
                          },
                          child: const Text(
                            "Open URL",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          )),
                    ],
                  )
                ],
              );
            },
          ).then((value) {
            isShowingDialog = false;
          });
        });
      }
    });
  }

  Widget scannedDialog() {
    return AlertDialog(
      content: SizedBox(
        width: 200,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 50,
            ),
            const SizedBox(height: 20),
            Text(
              '${result!.code}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Do you want to go to this address?',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () async {
                      if (await canLaunchUrlString(result!.code!)) {
                        await launchUrlString(result!.code!);
                        const SnackBar(
                          content: Text('Read QRCODE'),
                          duration: Duration(seconds: 2),
                        );
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
