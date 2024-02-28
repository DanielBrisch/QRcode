import 'package:flutter/material.dart';

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
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(17))
      ),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.089,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: GestureDetector(
            child: Center(
              child: Column(
                children: [
                    Icon(Icons.qr_code_scanner_outlined),
                    Text('scan')
                ],
            ),
            ),
            onTap: () {

            },
          ),
        ),
        SizedBox(
          child: GestureDetector(
            child: Center(
              child: Column(
                children: [
                    Icon(Icons.qr_code_scanner_outlined),
                    Text('scan')
                ],
            ),
            ),
            onTap: () {

            },
          ),
        )
      ],
      )
    );
  }
  }