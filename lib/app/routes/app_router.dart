import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/views/login_view.dart';

class AppRoutes {
  static String onboardingViewPath = '/';
  static String authViewPath = '/auth';
  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: authViewPath, page: () => const LoginView(),),
    ];
  }
}