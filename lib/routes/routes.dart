import 'package:flutter/material.dart';
import 'package:qrcode/views/create_page.dart';
import 'package:qrcode/views/history_page.dart';
import 'package:qrcode/views/home_page.dart';
import 'package:qrcode/views/info_page.dart';
import 'package:qrcode/views/login/login_selection_page.dart';
import 'package:qrcode/views/profile_page.dart';
import 'package:qrcode/views/scan_page.dart';
import 'package:qrcode/views/send_page.dart';
import 'package:qrcode/views/settings_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String history = '/history';
  static const String create = '/create';
  static const String scan = '/scan';
  static const String send = '/send';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String info = '/info';
  static const String loginSelection = '/loginSelection';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      history: (context) => const HistoryPage(),
      create: (context) => const CreatePage(),
      scan: (context) => const ScanPage(),
      send: (context) => const SendPage(),
      settings: (context) => const SettingsPage(),
      profile: (context) => const ProfilePage(),
      info: (context) => const InfoPage(),
      loginSelection: (context) => LoginSelectionPage()
    };
  }
}
