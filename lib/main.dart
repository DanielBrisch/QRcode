import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qrcode/generated/l10n.dart';
import 'package:qrcode/provider/providers.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppProviders(
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        locale: Locale('pt', 'BR'),
        routes: AppRoutes.getRoutes(),
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
