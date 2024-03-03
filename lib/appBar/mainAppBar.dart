import 'package:flutter/material.dart';
import 'package:qrcode/service/qrCodeService.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBar();
}

class _MainAppBar extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.089,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              child: GestureDetector(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,
                      color: QRService.setColor(QRService.createSelected)),
                  Text('create',
                      style: TextStyle(
                          color: QRService.setColor(QRService.createSelected)))
                ],
              ),
            ),
            onTap: () {
              if (ModalRoute.of(context)!.settings.name != '/create') {
                Navigator.pushNamed(context, '/create');
                setState(() {
                  QRService.allFalse();
                  QRService.createSelected = true;
                });
              }
            },
          )),
          SizedBox(
            child: GestureDetector(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner_outlined,
                        color: QRService.setColor(QRService.scanSelected)),
                    Text('scan',
                        style: TextStyle(
                            color: QRService.setColor(QRService.scanSelected)))
                  ],
                ),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != '/scan') {
                  Navigator.pushNamed(context, '/scan');
                  setState(() {
                    QRService.allFalse();
                    QRService.scanSelected = true;
                  });
                }
              },
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.history), Text('history')],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/history');
                if (ModalRoute.of(context)!.settings.name != '/history') {
                  Navigator.pushNamed(context, '/history');
                  setState(() {
                    QRService.allFalse();
                    QRService.historySelected = true;
                  });
                }
              },
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.print_outlined), Text('print')],
                ),
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.mail_outlined), Text('send')],
                ),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != '/send') {
                  Navigator.pushNamed(context, '/send');
                  setState(() {
                    QRService.allFalse();
                    QRService.sendSelected = true;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
