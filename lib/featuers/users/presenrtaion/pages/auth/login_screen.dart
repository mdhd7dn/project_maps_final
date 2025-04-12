import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/featuers/users/presenrtaion/controllers/user_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserController userController =
      Get.put<UserController>(Get.find<UserController>());
  // final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // باقي الكود كما هو...

                  SizedBox(height: 50.h),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w600,
                      fontSize: 32.sp,
                      height: 1.0,
                      letterSpacing: -3,
                      color: const Color(0xFF1A1A1A),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: _labelStyle()),
                  ),
                  SizedBox(height: 8.h),
                  _buildTextField(emailController, "Enter your email", false),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: _labelStyle()),
                  ),
                  SizedBox(height: 8.h),
                  _buildTextField(
                      passwordController, "Enter your password", true),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.restpassword);
                      },
                      child: Text(
                        "Forgot your password? Reset your password",
                        style: _linkStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GetBuilder<UserController>(
                    builder: (controller) {
                      return ElevatedButton(
                        style: _buttonStyle(),
                        onPressed: controller.loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              },
                        child: controller.loading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: "General Sans",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  _divider(),
                  SizedBox(height: 20.h),
                  _googleLoginButton(),
                  SizedBox(height: 20.h),

                  SizedBox(height: 20.h),
                  _facebookLoginButton(),
                  SizedBox(height: 120.h),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        "Don't have an account? Join",
                        style: _linkStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _googleLoginButton() {
    return GetBuilder<UserController>(
      builder: (controller) {
        return GestureDetector(
          onTap: controller.loading
              ? null
              : () {
                  // controller.signInWithGoogle();
                },
          child: Container(
            width: 341.w,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Color(0xFFCCCCCC)),
              color: controller.loading ? Colors.grey[200] : Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.loading)
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.grey,
                      ),
                    ),
                  )
                else
                  Image.asset(
                    'imges/google_icon.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                SizedBox(width: 12.w),
                Text(
                  "Login with Google",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: controller.loading ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

TextStyle _labelStyle() {
  return TextStyle(
    fontFamily: "General Sans",
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    height: 1.4,
    color: const Color(0xFF1A1A1A),
  );
}

TextFormField _buildTextField(
    TextEditingController controller, String hint, bool obscure) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Color(0xFFE6E6E6)),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return obscure ? "Password is required" : "Email is required";
      }
      if (!obscure && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        return "Enter a valid email";
      }
      return null;
    },
  );
}

TextStyle _linkStyle() {
  return TextStyle(
    fontFamily: "General Sans",
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 1.4,
    color: const Color(0xFF1A1A1A),
    decoration: TextDecoration.underline,
  );
}

ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFCCCCCC),
    minimumSize: Size(341.w, 54.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    padding: EdgeInsets.only(
      top: 16.h,
      right: 84.w,
      bottom: 16.h,
      left: 84.w,
    ),
  );
}

Widget _facebookLoginButton() {
  return GetBuilder<UserController>(
    builder: (controller) {
      return GestureDetector(
        onTap: controller.loading
            ? null
            : () {
                // controller.signInWithGoogle();
              },
        child: Container(
          width: 341.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Color(0xFFCCCCCC)),
            color: controller.loading
                ? Color(0xFF1877F2).withOpacity(0.7)
                : Color(0xFF1877F2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.loading)
                Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                Image.asset(
                  'imges/facbook_icoon.png',
                  width: 24.w,
                  height: 24.h,
                ),
              SizedBox(width: 12.w),
              Text(
                "Login with Facebook",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: controller.loading ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _divider() {
  return Row(
    children: [
      Expanded(child: Divider(color: Colors.grey)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Text("or"),
      ),
      Expanded(child: Divider(color: Colors.grey)),
    ],
  );
}
