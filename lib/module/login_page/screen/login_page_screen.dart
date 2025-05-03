import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_project/core/router/app_routes.dart';
import 'package:kopa_project/core/style/typhography_style.dart';
import 'package:kopa_project/module/login_page/controller/login_page_controller.dart';
import 'package:kopa_project/widgets/custom_button.dart';
import 'package:kopa_project/widgets/custom_textfield.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.login);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => controller.closeKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(height: 60),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.34,
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/images/general/logo_mb_white.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Text(
                          'Welcome',
                          style: TypographyStyle.h1.copyWith(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Please Login to your account',
                          style: TypographyStyle.body.copyWith(
                            fontSize: 16,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TypographyStyle.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: 'Enter Your Email',
                          prefixIcon: Icons.mail,
                        ),
                        const SizedBox(height: 20),
                        // Password Field
                        Text(
                          'Password',
                          style: TypographyStyle.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Obx(
                          () => CustomTextField(
                            controller: controller.passwordController,
                            hintText: 'Enter your Password',
                            prefixIcon: Icons.lock,
                            suffixIcon: controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            obscureText: !controller.isPasswordVisible.value,
                            focusNode: controller.passwordFocusNode,
                            onSuffixIconTap:
                                controller.togglePasswordVisibility,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       print('Forgot Password Clicked');
                        //     },
                        //     child: Text(
                        //       'Forgot Password?',
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         color: Colors.black,
                        //         decoration: TextDecoration.underline,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 52),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: CustomButton(
                            text: 'Login',
                            onPressed: () {
                              Get.offAllNamed(AppRoutes.mainNav);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
