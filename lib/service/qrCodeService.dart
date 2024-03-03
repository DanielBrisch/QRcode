import 'package:flutter/material.dart';

class QRService {
  static bool createSelected = false;
  static bool scanSelected = false;
  static bool historySelected = false;
  static bool printSelected = false;
  static bool sendSelected = false;

  static String type = 'QR-Code';
  static String element = 'Dixi';
  static String date = '20.04.2020';

  static void allFalse() {
    createSelected = false;
    scanSelected = false;
    historySelected = false;
    printSelected = false;
    sendSelected = false;
  }

  static Color setColor(bool screen) {
    return screen ? Colors.deepPurple : Colors.black;
  }
}
