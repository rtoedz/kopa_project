import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopa_project/cores/router/app_routes.dart';
import 'package:kopa_project/module/navigation/screen/main_nav.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // Variabel untuk status email dan password
  var email = ''.obs;
  var password = ''.obs;

  var isPasswordVisible = false.obs;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }


  void handleLogin() {
    print('Login button clicked');
  }
}
