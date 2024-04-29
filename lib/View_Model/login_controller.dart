import 'dart:convert';
import 'package:api_getx_flutter/Utils/toast_message.dart';
import 'package:api_getx_flutter/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('user');
    var user = jsonDecode(jsonString!);
    if (user != null) {
      if (user['email'].toString() == emailController.text.toString() &&
          user['password'].toString() == passwordController.text.toString()) {
        isLoading.value = false;
        Get.offAll(() => const HomeScreen());
        ToastMessage.showToastMessage(message: 'User logged in successfully');
      } else {
        isLoading.value = false;
        ToastMessage.showToastMessage(message: 'incorrect email or password');
      }
    } else {
      isLoading.value = false;
      ToastMessage.showToastMessage(
          message: 'user is not registered! please signup.');
    }
  }
}
