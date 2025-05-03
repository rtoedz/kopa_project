import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kopa_project/core/style/typhography_style.dart';
import 'package:kopa_project/module/scan_page/controller/scan_controller.dart';

class ResultScanScreen extends StatelessWidget {
  const ResultScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanController controller = Get.put(ScanController());
    return Scaffold(
      backgroundColor: HexColor('F9FAFB'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(Icons.check_circle, size: 180),
              Text(
                'Successfully Scanned',
                style: TypographyStyle.body.copyWith(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: Get.width,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: HexColor('000000').withValues(alpha: 0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Hello, Graham Bell',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 36),
                    Text(
                      'Customer Queue Number',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'A-1',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Vehicle Type',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Vehicle Type Dropdown
                    SizedBox(
                      width: Get.width * 0.6,
                      child: DropdownButtonFormField2<String>(
                        value:
                            controller.selectedVehicleType.value.isEmpty
                                ? null
                                : controller.selectedVehicleType.value,
                        onChanged: (String? newValue) {
                          controller.selectedVehicleType.value = newValue ?? '';
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: HexColor('868686')),
                          ),
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Vehicle Type',
                          style: TypographyStyle.body.copyWith(fontSize: 14),
                        ),
                        style: TypographyStyle.body.copyWith(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        iconStyleData: IconStyleData(
                          icon: const Icon(Icons.keyboard_arrow_up),
                          iconSize: 24,
                          openMenuIcon: const Icon(Icons.keyboard_arrow_down),
                          iconEnabledColor: HexColor('868686'),
                        ),
                        buttonStyleData: ButtonStyleData(
                          height: 32,
                          padding: EdgeInsets.zero,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          width: null,
                          elevation: 0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide.none,
                              left: BorderSide(color: HexColor('868686')),
                              right: BorderSide(color: HexColor('868686')),
                              bottom: BorderSide(color: HexColor('868686')),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          offset: const Offset(0, 0),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        selectedItemBuilder: (context) {
                          return controller.vehicleType.map((vehicleType) {
                            return Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                vehicleType,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList();
                        },
                        items:
                            controller.vehicleType.asMap().entries.map((entry) {
                              final int index = entry.key;
                              final String vehicleType = entry.value;
                              final bool isLast =
                                  index == controller.vehicleType.length - 1;
                              return DropdownMenuItem<String>(
                                value: vehicleType,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Center(
                                        child: Text(
                                          vehicleType,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    if (!isLast)
                                      Divider(
                                        height: 2,
                                        thickness: 1,
                                        color: HexColor('868686'),
                                      ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You can change the car type*',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: Get.width * 0.95,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('5BC157'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: TypographyStyle.body.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width * 0.95,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('EB4B4B'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TypographyStyle.body.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
