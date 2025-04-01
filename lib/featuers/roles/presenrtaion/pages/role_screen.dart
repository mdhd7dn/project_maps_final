import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/roles/presenrtaion/controllers/role_controller.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RoleController roleController = Get.find<RoleController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Role Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter User ID to Fetch Role:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: roleController.idController,
              decoration: const InputDecoration(
                hintText: 'Enter User ID',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String userId = roleController.idController.text;
                if (userId.isNotEmpty) {
                  roleController.getRoleById(userId);
                } else {
                  Get.snackbar('Error', 'Please enter a valid User ID');
                }
              },
              child: const Text('Fetch Role'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (roleController.loading.value) {
                return const CircularProgressIndicator();
              }
              if (roleController.role.value != null) {
                return Text('Role: ${roleController.role.value!.name}');
              } else {
                return const Text('No Role Found');
              }
            }),
          ],
        ),
      ),
    );
  }
}
