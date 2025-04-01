import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/controllers/consultation_controller.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/pages/consultation_card.dart';

class ConsultationsContent extends StatelessWidget {
  final String searchQuery;
  final ConsultationController _consultationController = Get.find();

  ConsultationsContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final filteredConsultations =
        _consultationController.consultations.where((consultation) {
      final question = consultation.question?.toString().toLowerCase() ?? '';
      final lawyerId = consultation.lawyerId?.toString().toLowerCase() ?? '';
      final date = consultation.date?.toString().toLowerCase() ?? '';

      return question.contains(searchQuery.toLowerCase()) ||
          lawyerId.contains(searchQuery.toLowerCase()) ||
          date.contains(searchQuery.toLowerCase());
    }).toList();

    if (searchQuery.isNotEmpty && filteredConsultations.isEmpty) {
      return Center(
        child: Text(
          'غير موجود',
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),
      );
    }

    final displayConsultations = searchQuery.isEmpty
        ? _consultationController.consultations
        : filteredConsultations;

    return RefreshIndicator(
      onRefresh: () async => await _consultationController.getConsultations(),
      child: Obx(() {
        if (_consultationController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (displayConsultations.isEmpty) {
          return Center(
            child: Text(
              'لا توجد استشارات متاحة',
              style: TextStyle(fontSize: 18.sp),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.builder(
            itemCount: displayConsultations.length,
            itemBuilder: (context, index) {
              return ConsultationCard(
                  consultation: displayConsultations[index]);
            },
          ),
        );
      }),
    );
  }
}
