import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kopa_project/module/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(233, 255, 255, 255),
          body: Container(
            padding: const EdgeInsets.only(top: 80, bottom: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 226, 226, 226),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 
                    'assets/images/splash_screen/kopa_logo.png',
                    width: 200,
                    height: 200,
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