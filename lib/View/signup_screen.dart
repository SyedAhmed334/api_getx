import 'package:api_getx_flutter/View/Widgets/custom_button.dart';
import 'package:api_getx_flutter/View/Widgets/custom_textfield.dart';
import 'package:api_getx_flutter/View/login_screen.dart';
import 'package:api_getx_flutter/View_Model/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    controller.printData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextfield(
                  controller: controller.usernameController,
                  hintText: 'Enter your username',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: controller.emailController,
                  hintText: 'Enter your email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: controller.passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomButton(
                      text: 'Signup',
                      isLoading: controller.isLoading.value,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await controller.signUp();
                          await controller.printData();
                        }
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: const Text(
                        'Already a user? Login',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
