import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registerViewPath,
      getPages: AppRoutes.getRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor,),
        fontFamily: 'Manjari',
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
    );
    // hello
  }
}
