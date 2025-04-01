import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_case/featuers/documents/domain/entities/document.dart';

class DocumentCard extends StatelessWidget {
  final Document document;

  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "مستند قانوني",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(
                      'ID: ${document.id}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(height: 20.h, thickness: 1),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildInfoItem(Icons.credit_card, 'رقم الهوية',
                      document.nationalId ?? 'غير متوفر'),
                  SizedBox(height: 8.h),
                  _buildInfoItem(Icons.person, 'رقم المستخدم',
                      document.userId?.toString() ?? 'غير متوفر'),
                  SizedBox(height: 8.h),
                  _buildInfoItem(Icons.folder, 'رقم القضية',
                      document.caseId?.toString() ?? 'غير متوفر'),
                ],
              ),
              if (document.nationalIDCard != null &&
                  document.nationalIDCard!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'صورة الهوية:',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: 300.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.grey[200],
                        ),
                        child: _buildDocumentImage(document.nationalIDCard!),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 24.w, color: Colors.blue),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentImage(String imageUrl) {
    try {
      Uri uri = Uri.parse(imageUrl);
      if (uri.host.isEmpty) {
        return _buildErrorWidget('رابط الصورة غير صالح');
      }

      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget('تعذر تحميل الصورة');
        },
      );
    } catch (e) {
      return _buildErrorWidget('رابط غير صالح');
    }
  }

  Widget _buildErrorWidget(String message) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 40.w),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
