import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_case/featuers/cases/domain/entities/case.dart';

class CaseCard extends StatelessWidget {
  final Case caseItem;

  const CaseCard({super.key, required this.caseItem});

  @override
  Widget build(BuildContext context) {
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
              'التاريخ: ${_formatDate(caseItem.date.toString())}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 12.h),
            Text(
              'الوصف:',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              caseItem.description ?? 'لا يوجد وصف',
              style: TextStyle(fontSize: 14.sp),
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

  String _formatDate(String? dateString) {
    if (dateString == null) return 'غير محدد';
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
