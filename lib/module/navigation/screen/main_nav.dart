// main_nav_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kopa_project/cores/style/typhography_style.dart';
import 'package:kopa_project/module/home_page/screen/home_page_alt_screen.dart';
import 'package:kopa_project/module/home_page/screen/home_page_screen.dart';
import 'package:kopa_project/module/navigation/controller/nav_controller.dart';
import 'package:kopa_project/module/profile/screen/profile_screen.dart';
import 'package:kopa_project/module/profile/screen/profilealt_screen.dart';
import 'package:kopa_project/module/scan_page/screen/scan_screen.dart';
import 'package:kopa_project/module/scan_page/screen/showqr_screen.dart';
import 'package:kopa_project/widgets/custom_button.dart';

class MainNavPage extends StatelessWidget {
  MainNavPage({super.key});

  final NavController navController = Get.put(NavController());

  final List<Widget> pages = const [
    // HomePageScreen(),
    HomePageAltScreen(),
    // ScanPageScreen(),
    ShowqrPageScreen(),
    // ProfilePageScreen(),
    ProfileAltPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: navController.currentIndex.value,
            onTap: navController.changePage,
            selectedItemColor: HexColor('0B0909'),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TypographyStyle.body.copyWith(
              fontSize: 16,
              color: HexColor('0B0909'),
            ),
            unselectedLabelStyle: TypographyStyle.body.copyWith(
              fontSize: 16,
              color: Colors.grey,
            ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                // label: 'Scan',
                label: 'Show QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
