import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            CustomTextField(
              controller: controller.mobileController,
              hintText: ' Enter your mobile number',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.phone,
              // prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 16),
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
                      Icon(
                        Icons.upload,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Upload your driving license',
                        style: TypographyStyle.body.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                    ],
                  )),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.fullNameController,
              hintText: 'Enter your full name',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.name,
              // prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),
            // Vehicle Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedVehicle.value.isEmpty
                      ? null
                      : controller.selectedVehicle.value,
                  onChanged: (String? newValue) {
                    controller.selectedVehicle.value = newValue ?? '';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select Vehicle'),
                  style: TypographyStyle.body.copyWith(
                      color: Colors.black54), // 🔹 This is the hint text
                  items: controller.vehicles.map((String vehicle) {
                    return DropdownMenuItem<String>(
                      value: vehicle,
                      child: Text(vehicle),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.emailController,
              hintText: 'Enter your email address',
              hintStyle: TypographyStyle.body.copyWith(color: Colors.black54),
              keyboardType: TextInputType.emailAddress,
              // prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16),
            // Province Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedProvince.value.isEmpty
                      ? null
                      : controller.selectedProvince.value,
                  onChanged: (String? newValue) {
                    controller.selectedProvince.value = newValue ?? '';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select Province'),
                  style: TypographyStyle.body.copyWith(color: Colors.black54),
                  items: controller.provinces.map((String province) {
                    return DropdownMenuItem<String>(
                      value: province,
                      child: Text(province),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            // Regency Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedRegency.value.isEmpty
                      ? null
                      : controller.selectedRegency.value,
                  onChanged: (String? newValue) {
                    controller.selectedRegency.value = newValue ?? '';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select Regency'),
                  style: TypographyStyle.body.copyWith(color: Colors.black54),
                  items: controller.regencies.map((String regency) {
                    return DropdownMenuItem<String>(
                      value: regency,
                      child: Text(regency),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            // Source Info Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedSourceInfo.value.isEmpty
                      ? null
                      : controller.selectedSourceInfo.value,
                  onChanged: (String? newValue) {
                    controller.selectedSourceInfo.value = newValue ?? '';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select Source Info'),
                  style: TypographyStyle.body.copyWith(color: Colors.black54),
                  items: controller.sourceInfos.map((String info) {
                    return DropdownMenuItem<String>(
                      value: info,
                      child: Text(info),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            // Dealer Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedDealer.value.isEmpty
                      ? null
                      : controller.selectedDealer.value,
                  onChanged: (String? newValue) {
                    controller.selectedDealer.value = newValue ?? '';
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select Dealer'),
                  style: TypographyStyle.body.copyWith(color: Colors.black54),
                  items: controller.dealers.map((String dealer) {
                    return DropdownMenuItem<String>(
                      value: dealer,
                      child: Text(dealer),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            // Sales Accountant Dropdown
            CustomTextField(
              controller: controller.SalesAccountantController,
              hintText: 'Enter Sales Accountant Name',
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
