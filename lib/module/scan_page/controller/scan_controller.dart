import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanController extends GetxController {
  final MobileScannerController cameraController = MobileScannerController();

  bool _hasScanned = false;

  void handleBarcode(String code) {
    if (_hasScanned) return;
    _hasScanned = true;

    Get.defaultDialog(
      title: 'QR Code Detected',
      middleText: code,
      confirm: ElevatedButton(
        onPressed: () {
          _hasScanned = false; // Reset after dialog closed
          Get.back();
        },
        child: const Text('OK'),
      ),
    );
  }

  void toggleTorch() {
    cameraController.toggleTorch();
  }

  void switchCamera() {
    cameraController.switchCamera();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
