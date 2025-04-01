import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

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
                "Forgot password",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "General Sans",
                  letterSpacing: -0.05,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter your email for the verification",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "General Sans",
                  letterSpacing: 0,
                  color: Color(0xFF808080),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "General Sans",
                  height: 1.4,
                  letterSpacing: 0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        BorderSide(color: Color(0xFFE6E6E6), width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        BorderSide(color: Color(0xFF1A1A1A), width: 1.w),
                  ),
                ),
              ),
              SizedBox(height: 200.h),
              SizedBox(
                width: 341.w,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.enterDigitCode);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 84.w),
                  ),
                  child: Text(
                    "Send Code",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
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
