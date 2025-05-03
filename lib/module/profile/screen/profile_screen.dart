import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_project/core/style/typhography_style.dart';
import 'package:kopa_project/widgets/custom_appbar.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Profile', // Custom title
        actions: [],
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 120, color: Colors.black),
                    Text(
                      'Alexander Graham Bell',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'hellograham@gmail.com',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '+6283543283572341',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
