import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/hearings/presenrtaion/controllers/hearing_controller.dart';
import 'package:my_case/featuers/hearings/presenrtaion/pages/hearing_card.dart';

class HearingsContent extends StatelessWidget {
  final HearingController _hearingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_hearingController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (_hearingController.error.value.isNotEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _hearingController.error.value,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _hearingController.fetchHearings(),
              child: Text('إعادة المحاولة'),
            ),
          ],
        );
      }

      return ListView.builder(
        itemCount: _hearingController.hearings.length,
        itemBuilder: (context, index) {
          return HearingCard(hearing: _hearingController.hearings[index]);
        },
      );
    });
  }
}
