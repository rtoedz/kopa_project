import 'package:flutter/material.dart';
import 'package:kopa_project/core/style/typhography_style.dart';
import 'package:kopa_project/module/scan_page/controller/scan_controller.dart';
import 'package:kopa_project/widgets/custom_appbar.dart';
import 'package:kopa_project/widgets/custom_button.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';

class ScanPageScreen extends StatelessWidget {
  const ScanPageScreen({super.key});
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: MobileScanner(
                    controller: controller.cameraController,
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        debugPrint('QR Code found: ${barcode.rawValue}');
                        // You can also call a controller method here
                      }
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Scan Barcode to Confirm Customer Queue Number',
                textAlign: TextAlign.center,
                style: TypographyStyle.body.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              CustomButton(
                onPressed: () {
                  Get.toNamed('/resultScan');
                },
                text: 'Scan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
