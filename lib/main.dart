import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/data/repositorys/user/i_user_repository.dart';
import 'package:qrcode/data/repositorys/user/user_repository.dart';
import 'package:qrcode/routes/routes.dart';
import 'package:qrcode/stores/home_store.dart';
import 'package:qrcode/views/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userRepository = UserRepository();

  await checkFirstRun(userRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<IUserRepository>.value(value: userRepository),
        Provider<HomeStore>(
          create: (context) => HomeStore(
            userRepository: context.read<IUserRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        routes: AppRoutes.getRoutes(),
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

Future<void> checkFirstRun(IUserRepository userRepository) async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstRun = prefs.getBool('is_first_run') ?? true;

  if (isFirstRun) {
    await insertInitialUser(userRepository);

    await prefs.setBool('is_first_run', false);
  }
}

Future<void> insertInitialUser(IUserRepository userRepository) async {
  await userRepository.insertUser(
    User(
        firstName: 'Daniel',
        email: 'daniel@test.com',
        image: './lib/assets/happyguy.png'),
  );
}
