import 'package:flutter/material.dart';
import 'package:qrcode/create/createPage.dart';
import 'package:qrcode/service/qrCodeService.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: null,
      ),
    );
  }
}