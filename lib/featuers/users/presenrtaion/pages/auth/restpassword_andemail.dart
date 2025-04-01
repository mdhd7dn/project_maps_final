import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 60.r),
            SizedBox(height: 20.h),
            Text(
              "Password Changed Successfully!",
              style: TextStyle(
                fontFamily: "General Sans",
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: 200.w,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
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
                Text(
                  "Set the new password for your account",
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 1.4,
                    color: const Color(0xFF808080),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Current Password",
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    height: 1.4,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 8.h),
                _buildPasswordField(
                    _currentPasswordController, "Enter current password"),
                SizedBox(height: 20.h),
                Text(
                  "New Password",
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    height: 1.4,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 8.h),
                _buildPasswordField(
                    _newPasswordController, "Enter new password"),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 341.w,
                  height: 54.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    onPressed: () {
                      _showSuccessDialog(context);
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
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint) {
    return SizedBox(
      width: 341.w,
      height: 52.h,
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Color(0xFFE6E6E6), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
        ),
      ),
    );
  }
}
