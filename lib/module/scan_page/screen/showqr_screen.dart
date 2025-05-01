import 'package:flutter/material.dart';
import 'package:kopa_project/cores/style/typhography_style.dart';
import 'package:kopa_project/module/scan_page/controller/scan_controller.dart';
import 'package:kopa_project/widgets/custom_appbar.dart';
import 'package:kopa_project/widgets/custom_button.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';

class ShowqrPageScreen extends StatelessWidget {
  const ShowqrPageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ScanController controller = ScanController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Scan QR', // Custom title
        actions: [],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Alexander Graham Bell',
                style: TypographyStyle.body.copyWith(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Time : 10:00 AM',
                style: TypographyStyle.body.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '25 May 2025',
                style: TypographyStyle.body.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: Get.width,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(Icons.qr_code_2, size: 300, color: Colors.black),
                ),
              ),
              const SizedBox(height: 52),
              SizedBox(
                width: Get.width,
                child: CustomButton(
                  onPressed: () {
                    Get.toNamed('/resultScan');
                  },
                  text: 'Save QR Code',
                  icon: Icons.download,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
