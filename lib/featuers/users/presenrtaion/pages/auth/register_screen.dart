import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/users/data/models/user_model.dart';
import 'package:my_case/featuers/users/presenrtaion/controllers/user_controller.dart';

class Register extends StatelessWidget {
  final UserController _controller = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Create an account",
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
                  "Let's create your account.",
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 1.4,
                    letterSpacing: 0,
                    color: const Color(0xFF808080),
                  ),
                ),
                SizedBox(height: 40.h),
                _buildLabel("Full Name"),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: _nameController,
                  hint: "Enter your full name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.contains('  ')) {
                      return 'Name cannot contain spaces';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildLabel("Email"),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: _emailController,
                  hint: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildLabel("Face of the Card"),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: _cardController,
                  hint: "Enter 14-digit card number",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter card number';
                    }
                    if (value.length != 14 ||
                        !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Card number must be 14 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildLabel("Password"),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: _passwordController,
                  hint: "Enter your password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.contains(' ')) {
                      return 'Password cannot contain spaces';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'At least one uppercase letter';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'At least one number';
                    }
                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'At least one special character';
                    }
                    if (value.length < 8) {
                      return 'Minimum 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildLabel("Confirm Password"),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hint: "Confirm your password",
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 342.w,
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Form validated successfully');

                        final user = UserModel(
                          id: '',
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          name: _nameController.text.trim(),
                          faceOfTheCard: _cardController.text.trim(),
                        );

                        print('User data to send:');
                        print('Name: ${user.name}');
                        print('Email: ${user.email}');
                        print('Card: ${user.faceOfTheCard}');

                        await _controller.register(
                            user, _passwordController.text);
                      }
                    },
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        fontFamily: "General Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "General Sans",
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1.4,
        letterSpacing: 0,
        color: const Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return SizedBox(
      width: 341.w,
      height: 52.h,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
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
        validator: validator,
      ),
    );
  }
}
