import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/appBar/mainAppBar.dart';
import 'package:qrcode/service/qrCodeService.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  double _zoomValue = 0.5;

  bool boolShowDialog = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scanAreaHeigth = MediaQuery.of(context).size.height * 0.4;
    var scanAreaWidth = MediaQuery.of(context).size.width * 0.8;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
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
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 25),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                  setState(() {
                    QRService.allFalse();
                  });
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
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                              Icon(Icons.image_outlined, color: Colors.white),
                              Text('Image scan',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ))),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            child: Icon(Icons.zoom_out, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const MainAppBar(),
              ],
            )),
      ]),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future<void> exibeDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Icon(Icons.check_circle, color: Colors.green)),
          content: const Center(
            child: Text('Successful scanning'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
