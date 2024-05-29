import 'package:flutter/material.dart';
import 'package:qrcode/create/createPage.dart';
import 'package:qrcode/history/historyPage.dart';
import 'package:qrcode/home/homePage.dart';
import 'package:qrcode/info/info.dart';
import 'package:qrcode/loadingApp/loadingApp.dart';
import 'package:qrcode/profile/profilePage.dart';
import 'package:qrcode/scan/scanPage.dart';
import 'package:qrcode/send/sendPage.dart';
import 'package:qrcode/settings/settingsPage.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home': (context) => const HomePage(),
      '/history': (context) => const HistoryPage(),
      '/create': (context) => const CreatePage(),
      '/scan': (context) => const ScanPage(),
      '/send': (context) => const SendPage(),
      '/settings': (context) => const SettingsPage(),
      '/profile': (context) => const ProfilePage(),
      '/info': (context) => const InfoPage(),
    },
    home: const LoginAppPage(),
    debugShowCheckedModeBanner: false,
  ));
}
