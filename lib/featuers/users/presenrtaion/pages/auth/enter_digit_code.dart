import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';

class EnterDigitCode extends StatelessWidget {
  final List<TextEditingController> _digitControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  EnterDigitCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 24.sp),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter 4 Digit Code",
                style: TextStyle(
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w600,
                  fontSize: 32.sp,
                  height: 1.0,
                  letterSpacing: -0.05,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 1.4,
                    letterSpacing: 0,
                    color: const Color(0xFF808080),
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "Enter 4 digit code that you receive on your email ",
                    ),
                    const TextSpan(
                      text: "(cody.fisher45@example.com)",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 64.w,
                    height: 60.h,
                    child: TextField(
                      controller: _digitControllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar('شكرا لك انتظر قليلا ثم اعد المحاولة لاحقا',
                        e.toString());
                    print("Resend code tapped");
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: "General Sans",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        height: 1.4,
                        letterSpacing: 0,
                        color: const Color(0xFF1A1A1A),
                      ),
                      children: [
                        const TextSpan(
                          text: "Email not received? ",
                        ),
                        TextSpan(
                          text: "Resend code",
                          style: TextStyle(
                            fontFamily: "General Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            letterSpacing: -0.02,
                            color: const Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 341.w,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.only(
                      top: 16.h,
                      right: 84.w,
                      bottom: 16.h,
                      left: 84.w,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.restpasswordandemail);
                    print("Continue pressed");
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
