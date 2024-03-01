import 'package:flutter/material.dart';
import 'package:qrcode/create/createPage.dart';
import 'package:qrcode/loadingApp/loadingApp.dart';
import 'package:qrcode/scan/scanPage.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/create': (context) => const CreatePage(),
      '/scan': (context) => const ScanPage(),
      // adicione outras rotas conforme necessário
    },
    home: const LoginAppPage(),
    debugShowCheckedModeBanner: false,
  ));
}
