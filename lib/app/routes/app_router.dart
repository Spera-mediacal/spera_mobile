import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/views/login_view.dart';
import 'package:spera_mobile/app/views/auth_view/views/register_view.dart';

class AppRoutes {
  static String onboardingViewPath = '/';
  static String loginViewPath = '/login';
  static String registerViewPath = '/register';
  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: loginViewPath, page: () => const LoginView(),),
      GetPage(name: registerViewPath, page: () => const RegisterView(),),
    ];
  }
}