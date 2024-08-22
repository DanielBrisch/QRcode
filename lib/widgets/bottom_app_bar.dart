import 'package:flutter/material.dart';

class PrincipalBottomAppBar extends StatefulWidget {
  const PrincipalBottomAppBar({super.key});

  @override
  State<PrincipalBottomAppBar> createState() => _PrincipalBottomAppBar();
}

class _PrincipalBottomAppBar extends State<PrincipalBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.089,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.add_circle_outline,
                    //     color: QRService.setColor(QRService.createSelected)),
                    // Text('create',
                    //     style: TextStyle(
                    //         color:
                    //             QRService.setColor(QRService.createSelected)))
                  ],
                ),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != '/create') {
                  Navigator.pushNamed(context, '/create');
                }
              },
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.qr_code_scanner_outlined,
                    //     color: QRService.setColor(QRService.scanSelected)),
                    // Text('scan',
                    //     style: TextStyle(
                    //         color: QRService.setColor(QRService.scanSelected)))
                  ],
                ),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != '/scan') {
                  Navigator.pushNamed(context, '/scan');
                }
              },
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.history,
                    //     color: QRService.setColor(QRService.historySelected)),
                    // Text('history',
                    //     style: TextStyle(
                    //         color:
                    //             QRService.setColor(QRService.historySelected)))
                  ],
                ),
              ),
              onTap: () {
                if (ModalRoute.of(context)!.settings.name != '/history') {
                  Navigator.pushNamed(context, '/history');
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
