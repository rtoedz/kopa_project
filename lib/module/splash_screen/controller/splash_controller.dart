import 'package:get/get.dart';
import 'package:kopa_project/core/router/app_routes.dart';


class SplashScreenController extends GetxController {

  Future<void> nextPage() async {
    await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    super.onInit();
    nextPage();
  }
}