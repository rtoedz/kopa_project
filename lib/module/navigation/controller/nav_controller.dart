// nav_controller.dart
import 'package:get/get.dart';

class NavController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
