import 'package:flutter/material.dart';
import 'package:qrcode/pages/create_page.dart';
import 'package:qrcode/pages/history_page.dart';
import 'package:qrcode/pages/home_page.dart';
import 'package:qrcode/pages/info_page.dart';
import 'package:qrcode/pages/loading_app_page.dart';
import 'package:qrcode/pages/profile_page.dart';
import 'package:qrcode/pages/scan_page.dart';
import 'package:qrcode/pages/send_page.dart';
import 'package:qrcode/pages/settings_page.dart';

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
