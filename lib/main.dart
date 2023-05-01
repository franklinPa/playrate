import 'package:flutter/material.dart';


import 'config/theme/app_theme.dart';
import 'package:playrate/config/router/app_router.dart';

//bceec611b45b42d69b33a0a1c26cd3ee
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
