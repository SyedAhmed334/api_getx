import 'package:api_getx_flutter/View/login_screen.dart';
import 'package:get/get.dart';

class SplashServices {
  static void isLogin() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => Get.offAll(() => const LoginScreen()));
  }
}
