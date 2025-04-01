import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/controllers/complaint_controller.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/pages/complaint_card.dart';

class ComplaintsContent extends StatelessWidget {
  final ComplaintController _complaintController = Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await _complaintController.fetchComplaints(),
      child: Obx(() {
        if (_complaintController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_complaintController.complaints.isEmpty) {
          return Center(
            child: Text(
              'لا توجد شكاوى متاحة',
              style: TextStyle(fontSize: 18.sp),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.builder(
            itemCount: _complaintController.complaints.length,
            itemBuilder: (context, index) {
              return ComplaintCard(
                  complaint: _complaintController.complaints[index]);
            },
          ),
        );
      }),
    );
  }
}
