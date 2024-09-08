import 'package:flutter/material.dart';
import 'package:qrcode/provider/providers.dart';
import 'package:qrcode/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppProviders(
      child: MaterialApp.router(
        routerConfig: Routes().router,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
