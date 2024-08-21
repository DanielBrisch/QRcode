import 'package:flutter/material.dart';
import 'package:qrcode/views/create_page.dart';
import 'package:qrcode/views/history_page.dart';
import 'package:qrcode/views/home_page.dart';
import 'package:qrcode/views/info_page.dart';
import 'package:qrcode/views/loading_app_page.dart';
import 'package:qrcode/views/profile_page.dart';
import 'package:qrcode/views/scan_page.dart';
import 'package:qrcode/views/send_page.dart';
import 'package:qrcode/views/settings_page.dart';

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
