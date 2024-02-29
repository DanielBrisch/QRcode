import 'package:flutter/material.dart';
import 'package:qrcode/create/createPage.dart';
import 'package:qrcode/scan/scanPage.dart';
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
                      Icon(Icons.add_circle_outline, color: colorButton(0)),
                      Text('create', style: TextStyle(color: colorButton(0)))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePage()));
                  setState(() {
                    QRService.pageSelected = 0;
                    QRService.colorForSelected = Colors.purpleAccent;
                  });
                }),
          ),
          SizedBox(
            child: GestureDetector(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner_outlined, color: colorButton(1)),
                    Text('scan', style: TextStyle(color: colorButton(1)))
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScanPage()));
                setState(() {
                  QRService.pageSelected = 1;
                  QRService.colorForSelected = Colors.purpleAccent;
                });
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
              onTap: () {},
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Color colorButton(number) {
    return QRService.pageSelected == number ? Colors.purple : Colors.black;
  }
}
