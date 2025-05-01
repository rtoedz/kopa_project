import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kopa_project/cores/router/app_routes.dart';
import 'package:kopa_project/cores/style/typhography_style.dart';
import 'package:kopa_project/module/test_drive_registration/controller/registration_controller.dart';
import 'package:kopa_project/widgets/custom_appbar.dart';
import 'package:kopa_project/widgets/custom_button.dart';
import 'package:kopa_project/widgets/custom_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegistrationController controller = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Test Drive Registration',
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.offAllNamed(AppRoutes.mainNav);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Mobile Number',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextField(
              controller: controller.mobileController,
              hintText: ' Enter your mobile number',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.phone,
              // prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 12),
            Text(
              'Driving License',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.grey,
              dashPattern: [6, 4],
              strokeWidth: 2,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, color: Colors.grey.shade500),
                    const SizedBox(height: 8),
                    Text(
                      'Upload your driving license',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Full Name',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextField(
              controller: controller.fullNameController,
              hintText: 'Enter your full name',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.name,
              // prefixIcon: Icons.person,
            ),
            const SizedBox(height: 12),
            // Vehicle Dropdown
            Text(
              'Vehicle',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: Get.width * 0.6,
              child: DropdownButtonFormField2<String>(
                value:
                    controller.selectedVehicle.value.isEmpty
                        ? null
                        : controller.selectedVehicle.value,
                onChanged: (String? newValue) {
                  controller.selectedVehicle.value = newValue ?? '';
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
                  'Select Vehicle',
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
                  return controller.vehicles.map((vehicleType) {
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
                    controller.vehicles.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String vehicleType = entry.value;
                      final bool isLast =
                          index == controller.vehicles.length - 1;
                      return DropdownMenuItem<String>(
                        value: vehicleType,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
            const SizedBox(height: 12),
            Text(
              'Email',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextField(
              controller: controller.emailController,
              hintText: 'Enter your email address',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.emailAddress,
              // prefixIcon: Icons.email,
            ),
            const SizedBox(height: 12),
            // Province Dropdown
            Text(
              'Province',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: Get.width * 0.6,
              child: DropdownButtonFormField2<String>(
                value:
                    controller.selectedProvince.value.isEmpty
                        ? null
                        : controller.selectedProvince.value,
                onChanged: (String? newValue) {
                  controller.selectedProvince.value = newValue ?? '';
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
                  'Select Province',
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
                  return controller.provinces.map((province) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        province,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList();
                },
                items:
                    controller.provinces.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String province = entry.value;
                      final bool isLast =
                          index == controller.provinces.length - 1;
                      return DropdownMenuItem<String>(
                        value: province,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  province,
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
            const SizedBox(height: 12),
            // Source Info Dropdown
            Text(
              'Source Info',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: Get.width * 0.6,
              child: DropdownButtonFormField2<String>(
                value:
                    controller.selectedSourceInfo.value.isEmpty
                        ? null
                        : controller.selectedSourceInfo.value,
                onChanged: (String? newValue) {
                  controller.selectedSourceInfo.value = newValue ?? '';
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
                  'Select Source Info',
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
                  return controller.sourceInfos.map((sourceInfo) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        sourceInfo,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList();
                },
                items:
                    controller.sourceInfos.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String sourceInfo = entry.value;
                      final bool isLast =
                          index == controller.sourceInfos.length - 1;
                      return DropdownMenuItem<String>(
                        value: sourceInfo,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  sourceInfo,
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
            const SizedBox(height: 12),
            // Dealer Dropdown
            Text(
              'Dealer',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: Get.width * 0.6,
              child: DropdownButtonFormField2<String>(
                value:
                    controller.selectedDealer.value.isEmpty
                        ? null
                        : controller.selectedDealer.value,
                onChanged: (String? newValue) {
                  controller.selectedDealer.value = newValue ?? '';
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
                  'Select Dealer',
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
                  return controller.dealers.map((dealer) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        dealer,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList();
                },
                items:
                    controller.dealers.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String dealer = entry.value;
                      final bool isLast =
                          index == controller.dealers.length - 1;
                      return DropdownMenuItem<String>(
                        value: dealer,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  dealer,
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
            const SizedBox(height: 12),
            // Sales Accountant Dropdown
            Text(
              'Sales Accountant',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextField(
              controller: controller.salesAccountantController,
              hintText: 'Enter Sales Accountant Name',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.name,
              // prefixIcon: Icons.person,
            ),
            const SizedBox(height: 12),
            // Sales Accountant Dropdown
            Text(
              'Sales Phone Number',
              style: TypographyStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            CustomTextField(
              controller: controller.salesPhoneNumberController,
              hintText: 'Enter Sales Phone Number',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.name,
              // prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: CustomButton(
                text: 'Submit Registration',
                onPressed: () {
                  controller.submitForm();
                  Get.offAllNamed(AppRoutes.home);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
