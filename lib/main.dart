import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
import 'package:spera_mobile/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.bottomViewPath,
      getPages: AppRoutes.getRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accentColor,
        ),
        fontFamily: 'Manjari',
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
    );
    // hello
  }
}
// whole
