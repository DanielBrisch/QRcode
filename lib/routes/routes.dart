import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrcode/views/create_page.dart';
import 'package:qrcode/views/history_page.dart';
import 'package:qrcode/views/home_page.dart';
import 'package:qrcode/views/info_page.dart';
import 'package:qrcode/views/login/login_selection_page.dart';
import 'package:qrcode/views/login/sing_in_page.dart';
import 'package:qrcode/views/profile_page.dart';
import 'package:qrcode/views/scan_page.dart';
import 'package:qrcode/views/send_page.dart';
import 'package:qrcode/views/settings_page.dart';

class Routes {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginSelectionPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: 'singIn',
            builder: (BuildContext context, GoRouterState state) {
              return const SingInPage();
            },
          ),
          GoRoute(
            path: 'history',
            builder: (BuildContext context, GoRouterState state) {
              return const HistoryPage();
            },
          ),
          GoRoute(
            path: 'create',
            builder: (BuildContext context, GoRouterState state) {
              return const CreatePage();
            },
          ),
          GoRoute(
            path: 'scan',
            builder: (BuildContext context, GoRouterState state) {
              return const ScanPage();
            },
          ),
          GoRoute(
            path: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
          GoRoute(
            path: 'send',
            builder: (BuildContext context, GoRouterState state) {
              return const SendPage();
            },
          ),
          GoRoute(
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsPage();
            },
          ),
          GoRoute(
            path: 'info',
            builder: (BuildContext context, GoRouterState state) {
              return const InfoPage();
            },
          ),
        ],
      ),
    ],
  );
}
