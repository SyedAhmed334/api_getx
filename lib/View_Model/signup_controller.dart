import 'dart:convert';
import 'dart:developer';

import 'package:api_getx_flutter/Utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> signUp() async {
    isLoading.value = true;
    Map<String, dynamic> user = {
      'username': usernameController.text.toString(),
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user)).then((value) {
      isLoading.value = false;
      ToastMessage.showToastMessage(message: 'user registered!');
    });
  }

  Future<void> printData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('user');
    if (jsonString != null) {
      var map = jsonDecode(jsonString) as Map<String, dynamic>;
      log('user registered');
      log(map['email'].toString());
      log(map['username'].toString());
      log(map['password'].toString());
    }
  }
}
