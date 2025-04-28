import 'package:get/get.dart';

class LoginController extends GetxController {
  // Variabel untuk menyimpan status login
  var email = ''.obs;
  var password = ''.obs;
  var isPasswordVisible = false.obs;

  // Fungsi untuk menangani login
  void handleLogin() {
    if (email.isNotEmpty && password.isNotEmpty) {
      print('Logging in with $email');
      // Implement login logic here
    } else {
      print('Please enter valid credentials');
    }
  }

  // Fungsi untuk toggle visibility password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
