import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/courts/presenrtaion/controllers/court_controller.dart';
import 'package:my_case/featuers/courts/presenrtaion/pages/court_card.dart';

class CourtsContent extends StatelessWidget {
  final CourtController _courtController = Get.find();
  final TextEditingController _courtIdController = TextEditingController();

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
                  controller: _courtIdController,
                  decoration: InputDecoration(
                    labelText: 'أدخل رقم المحكمة',
                    border: OutlineInputBorder(),
                    hintText: 'مثال: 1',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  if (_courtIdController.text.isNotEmpty) {
                    final id = int.tryParse(_courtIdController.text);
                    if (id != null) {
                      _courtController.getCourtById(id);
                    } else {
                      Get.snackbar('خطأ', 'الرجاء إدخال رقم صحيح');
                    }
                  } else {
                    Get.snackbar('خطأ', 'الرجاء إدخال رقم المحكمة');
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
            if (_courtController.loading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (_courtController.error.value.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_courtController.error.value),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_courtIdController.text.isNotEmpty) {
                          _courtController
                              .getCourtById(int.parse(_courtIdController.text));
                        }
                      },
                      child: Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }

            if (_courtController.currentCourt.value == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 50.w, color: Colors.grey),
                    Text('ادخل رقم المحكمة ثم اضغط بحث'),
                  ],
                ),
              );
            }

            return CourtCard(court: _courtController.currentCourt.value!);
          }),
        ),
      ],
    );
  }
}
