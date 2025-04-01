import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/featuers/users/presenrtaion/controllers/user_controller.dart';

class OnepageScreen extends StatelessWidget {
  OnepageScreen({super.key});
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Stack(
                children: List.generate(4, (index) {
                  return Positioned(
                    top: (index * 200).h,
                    left: (index.isEven ? 100 : 300).w,
                    child: Transform.rotate(
                      angle: 150 * (3.141592653589793 / 180),
                      child: Container(
                        width: 811.3.w,
                        height: 853.69.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFE6E6E6),
                            width: 2.w,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "احجز استشارتك القانونية الآن",
                      style: TextStyle(
                        fontFamily: "General Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 35.sp,
                        height: 0.8,
                        letterSpacing: -3,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      height: 700.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            top: -20.h,
                            child: Container(
                              width: 358.w,
                              height: 697.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("imges/onepage.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(60.w, 10.h),
                                    blurRadius: 80.r,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: 341.w,
                      height: 54.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A1A1A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 84.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const Icon(Icons.arrow_right_alt,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
