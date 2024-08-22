import 'package:flutter/material.dart';

class QRService {
  static String type = 'QR-Code';
  static String element = 'Dixi';
  static String date = '20.04.2020';

  static Color setColor(bool screen) {
    return screen ? Colors.deepPurple : Colors.black;
  }
}
