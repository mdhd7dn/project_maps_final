import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/cases/data/datasources/case_datasorce.dart';
import 'package:my_case/featuers/cases/data/repositories/case_repositories.dart';
import 'package:my_case/featuers/cases/domain/entities/case.dart';
import 'package:my_case/featuers/cases/presenrtaion/controllers/case_controller.dart';

class CaseScreen extends StatelessWidget {
  const CaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CaseController>()) {
      Get.put(CaseController(CaseRepositoryImpl(CaseDatasource())));
    }

    final controller = Get.find<CaseController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'القضايا',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حدث خطأ: ${controller.error.value}'),
                ElevatedButton(
                  onPressed: () => controller.getCases(),
                  child: Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        }

        if (controller.cases.isEmpty) {
          return Center(
            child: Text('لا توجد قضايا متاحة'),
          );
        }

        return ListView.builder(
          itemCount: controller.cases.length,
          itemBuilder: (context, index) =>
              _buildCaseCard(controller.cases[index]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => AddCaseScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCaseCard(Case caseItem) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'رقم القضية: ${caseItem.caseNumber}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor(caseItem.status),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    caseItem.status ?? 'غير محدد',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'النوع: ${caseItem.caseType ?? 'غير محدد'}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'التاريخ: ${_formatDate(caseItem.date)}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 12.h),
            Text(
              'الوصف:',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            SizedBox(height: 4.h),
            Text(
              caseItem.description ?? 'لا يوجد وصف',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, size: 20.w),
                  onPressed: () {},
                ),
                SizedBox(width: 8.w),
                // IconButton(
                //   icon: Icon(Icons.delete, size: 20.w, color: Colors.red),
                //   onPressed: () {
                //
                //     if (caseItem.id != null) {
                //       controller.(caseItem.id!);
                //     }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'مفتوحة':
        return Colors.green;
      case 'مغلقة':
        return Colors.red;
      case 'قيد المراجعة':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
