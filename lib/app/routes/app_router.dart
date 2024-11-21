import 'package:get/get.dart';

class AppRoutes {
  static String onboardingViewPath = '/';
  static String authViewPath = '/auth';
  static List<GetPage<dynamic>> getRoutes() {
    return [
      //GetPage(name: authViewPath, page: () => const AuthView(),),
    ];
  }
}