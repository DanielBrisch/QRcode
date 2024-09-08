// lib/providers.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/data/repositorys/user/i_user_repository.dart';
import 'package:qrcode/data/repositorys/user/user_repository.dart';
import 'package:qrcode/stores/home_store.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({required this.child});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();

    return MultiProvider(
      providers: [
        Provider<IUserRepository>.value(
          value: userRepository,
        ),
        Provider<HomeStore>(
          create: (context) => HomeStore(
            userRepository: context.read<IUserRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
