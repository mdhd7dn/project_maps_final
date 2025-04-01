import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/cases/presenrtaion/controllers/case_controller.dart';
import 'package:my_case/featuers/cases/presenrtaion/pages/case_card.dart';

class CasesContent extends StatelessWidget {
  final String searchQuery;
  final CaseController _caseController = Get.find();

  CasesContent({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final filteredCases = _caseController.cases.where((caseItem) {
      final caseNumber = caseItem.caseNumber?.toString().toLowerCase() ?? '';
      final caseType = caseItem.caseType?.toString().toLowerCase() ?? '';
      final description = caseItem.description?.toString().toLowerCase() ?? '';

      return caseNumber.contains(searchQuery.toLowerCase()) ||
          caseType.contains(searchQuery.toLowerCase()) ||
          description.contains(searchQuery.toLowerCase());
    }).toList();

    if (searchQuery.isNotEmpty && filteredCases.isEmpty) {
      return Center(
        child: Text(
          'غير موجود',
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),
      );
    }

    final displayCases =
        searchQuery.isEmpty ? _caseController.cases : filteredCases;

    return RefreshIndicator(
      onRefresh: () async => await _caseController.getCases(),
      child: Obx(() {
        if (_caseController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_caseController.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حدث خطأ: ${_caseController.error.value}'),
                ElevatedButton(
                  onPressed: () => _caseController.getCases(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        }

        if (displayCases.isEmpty) {
          return Center(
            child: Text(
              'لا توجد قضايا متاحة',
              style: TextStyle(fontSize: 18.sp),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.builder(
            itemCount: displayCases.length,
            itemBuilder: (context, index) {
              return CaseCard(caseItem: displayCases[index]);
            },
          ),
        );
      }),
    );
  }
}
