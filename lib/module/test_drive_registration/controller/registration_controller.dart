import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistrationController extends GetxController {
  // Controllers for text fields
  var mobileController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var SalesAccountantController = TextEditingController();

  // Reactive dropdown values
  var selectedVehicle = ''.obs;
  var selectedProvince = ''.obs;
  var selectedRegency = ''.obs;
  var selectedSourceInfo = ''.obs;
  var selectedDealer = ''.obs;

  // Dummy data for dropdowns
  final List<String> vehicles = ['Car', 'Motorcycle', 'Bicycle'];
  final List<String> provinces = ['Province A', 'Province B', 'Province C'];
  final List<String> regencies = ['Regency X', 'Regency Y', 'Regency Z'];
  final List<String> sourceInfos = ['Online', 'Referral', 'Advertisement'];
  final List<String> dealers = ['Dealer 1', 'Dealer 2', 'Dealer 3'];

  // Submit form
  void submitForm() {
    print('Mobile Number: ${mobileController.text}');
    print('Full Name: ${fullNameController.text}');
    print('Email: ${emailController.text}');
    print('Vehicle: $selectedVehicle');
    print('Province: $selectedProvince');
    print('Regency: $selectedRegency');
    print('Source Info: $selectedSourceInfo');
    print('Dealer: $selectedDealer');
    print('Sales Accountant: ${SalesAccountantController.text}');
  }
}
