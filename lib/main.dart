import 'package:chat/firebase_options.dart';
import 'package:chat/src/config/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import 'src/config/locator/app_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = locator<GoRouter>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screentype) {
      return MaterialApp.router(
        title: 'Prestige Calendar',
        theme: AppTheme.defaultTheme,
        routerConfig: _router,
      );
    });
  }
}
