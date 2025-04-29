import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kopa_project/cores/base/base_controller.dart';
import 'package:kopa_project/cores/router/app_pages.dart';
import 'package:kopa_project/cores/router/app_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseController.initialize();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      transitionDuration: const Duration(milliseconds: 300),
      title: 'Kopa Project',
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}