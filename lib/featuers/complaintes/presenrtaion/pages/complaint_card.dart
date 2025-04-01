import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_case/featuers/complaintes/domain/entities/complaint.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

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
            SizedBox(height: 8.h),
            Text(
              'الوصف: ${complaint.description ?? 'لا يوجد وصف'}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'التاريخ: ${_formatDate(complaint.date.toString())}',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            if (complaint.lawyerId != null) SizedBox(height: 8.h),
            if (complaint.lawyerId != null)
              Text(
                'المحامي: ${complaint.lawyerId}',
                style: TextStyle(fontSize: 14.sp),
              ),
          ],
        ),
      ),
    );
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
