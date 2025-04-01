import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, size: 24.sp),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.notifications_none, size: 24.sp),
                ],
              ),
            ),
            Divider(
                thickness: 1.h,
                color: const Color(0xFFE6E6E6),
                indent: 24.w,
                endIndent: 24.w),
            _buildAccountOption(
                context, 'My Cases', Icons.inventory_2_outlined),
            _buildDivider(),
            _buildAccountOption(context, 'My Details', Icons.badge_outlined),
            _buildDivider(),
            _buildAccountOption(context, 'Address Courts', Icons.home_outlined),
            _buildDivider(),
            _buildAccountOption(
                context, 'Payment Methods', Icons.credit_card_outlined),
            _buildDivider(),
            _buildAccountOption(
                context, 'Notifications', Icons.notifications_outlined),
            _buildDivider(),
            _buildAccountOption(context, 'FAQs', Icons.help_outline),
            _buildDivider(),
            _buildAccountOption(
                context, 'Help Center', Icons.headset_mic_outlined),
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 32.h),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 24.sp),
                    SizedBox(width: 16.w),
                    Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(
      BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: const Color(0xFF1A1A1A)),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ),
            Icon(Icons.chevron_right,
                size: 24.sp, color: const Color(0xFF1A1A1A)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
        thickness: 1.h,
        color: const Color(0xFFE6E6E6),
        indent: 24.w,
        endIndent: 24.w);
  }
}
