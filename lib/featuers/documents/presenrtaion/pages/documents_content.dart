import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/documents/presenrtaion/controllers/document_controller.dart';
import 'package:my_case/featuers/documents/presenrtaion/pages/document_card.dart';

class DocumentsContent extends StatelessWidget {
  final DocumentController _documentController = Get.find();
  final TextEditingController _documentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _documentIdController,
                  decoration: InputDecoration(
                    labelText: 'أدخل رقم الملف',
                    border: OutlineInputBorder(),
                    hintText: 'مثال: 1',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  if (_documentIdController.text.isNotEmpty) {
                    final id = int.tryParse(_documentIdController.text);
                    if (id != null) {
                      _documentController.getDocumentById(id);
                    } else {
                      Get.snackbar('خطأ', 'الرجاء إدخال رقم صحيح');
                    }
                  } else {
                    Get.snackbar('خطأ', 'الرجاء إدخال رقم الملف');
                  }
                },
                child: Text('بحث'),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (_documentController.loading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (_documentController.error.value.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_documentController.error.value),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_documentIdController.text.isNotEmpty) {
                          _documentController.getDocumentById(
                              int.parse(_documentIdController.text));
                        }
                      },
                      child: Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            if (_documentController.currentDocument.value == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 50.w, color: Colors.grey),
                    Text('ادخل رقم الملف ثم اضغط بحث'),
                  ],
                ),
              );
            }

            return DocumentCard(
                document: _documentController.currentDocument.value!);
          }),
        ),
      ],
    );
  }
}
