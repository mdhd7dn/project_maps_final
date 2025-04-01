import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_case/featuers/consultationes/domain/entities/consulation.dart';

class ConsultationCard extends StatelessWidget {
  final Consultation consultation;

  const ConsultationCard({super.key, required this.consultation});

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
                Expanded(
                  child: Text(
                    'السؤال:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                if (consultation.lawyerId != null)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'تم الرد',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              consultation.question,
              style: TextStyle(fontSize: 14.sp),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16.w, color: Colors.grey),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    'تاريخ الاستشارة: ${_formatDate(consultation.date.toString())}',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (consultation.userId != null) SizedBox(height: 8.h),
            if (consultation.userId != null)
              Row(
                children: [
                  Icon(Icons.person, size: 16.w, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      'رقم المستخدم: ${consultation.userId}',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            if (consultation.lawyerId != null) SizedBox(height: 8.h),
            if (consultation.lawyerId != null)
              Row(
                children: [
                  Icon(Icons.gavel, size: 16.w, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      'رقم المحامي: ${consultation.lawyerId}',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
