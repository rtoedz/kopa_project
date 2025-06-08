import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kopa_project/core/style/typhography_style.dart';
import 'package:kopa_project/widgets/custom_appbar.dart';

class QueueDashboard extends StatefulWidget {
  const QueueDashboard({super.key});

  @override
  State<QueueDashboard> createState() => _QueueDashboardState();
}

class _QueueDashboardState extends State<QueueDashboard> {
  @override
  void initState() {
    super.initState();
    // Set orientation to landscape when entering this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _resetOrientationAndGoBack() async {
    // Reset orientation to portrait first
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // Then go back to previous screen
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle device back button
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true; // Allow back navigation
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Dashboard',
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: _resetOrientationAndGoBack,
          ),
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Left side - Currently Servicing
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Currently Servicing',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Customer Queue Number',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'A-1',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 60,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Estimate Time',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '15 Mins',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Right side - Available Vehicle
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available Vehicle',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildVehicleRow(
                                'E-Class',
                                'All-Terrain 2025',
                                true,
                                'S-Class',
                                false,
                              ),
                              const SizedBox(height: 8),
                              _buildVehicleRow(
                                'EQE',
                                '',
                                true,
                                'EQS SUV',
                                false,
                              ),
                              const SizedBox(height: 8),
                              _buildVehicleRow(
                                'CLE-Class',
                                '',
                                true,
                                'GLA',
                                false,
                              ),
                              const SizedBox(height: 8),
                              _buildVehicleRow(
                                'GT43',
                                '',
                                true,
                                'C-Class',
                                false,
                              ),
                              const SizedBox(height: 8),
                              _buildVehicleRow(
                                'EQB',
                                '',
                                true,
                                'G-Class',
                                false,
                              ),
                              const SizedBox(height: 8),
                              _buildVehicleRow(
                                'SL43',
                                '',
                                true,
                                'CLE Cabriolet 2025',
                                false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleRow(
    String leftVehicle,
    String leftSubtitle,
    bool leftAvailable,
    String rightVehicle,
    bool rightAvailable,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildVehicleCard(leftVehicle, leftSubtitle, leftAvailable),
        ),
        const SizedBox(width: 8),
        Expanded(child: _buildVehicleCard(rightVehicle, '', rightAvailable)),
      ],
    );
  }

  Widget _buildVehicleCard(
    String vehicleName,
    String subtitle,
    bool isAvailable,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  vehicleName,
                  style: TypographyStyle.body.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TypographyStyle.body.copyWith(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Status',
                      style: TypographyStyle.body.copyWith(
                        fontSize: 9,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        isAvailable ? 'Available' : 'In-Use',
                        style: TypographyStyle.body.copyWith(
                          fontSize: 9,
                          color: isAvailable ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isAvailable ? Colors.green : Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isAvailable ? Icons.check : Icons.access_time,
              color: Colors.white,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
