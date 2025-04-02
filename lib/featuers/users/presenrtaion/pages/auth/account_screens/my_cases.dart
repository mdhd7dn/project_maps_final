import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyCases extends StatefulWidget {
  MyCases({super.key});

  @override
  State<MyCases> createState() => _MyCasesState();
}

class _MyCasesState extends State<MyCases> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w), // ضبط الهوامش الجانبية
        child: Stack(
          children: [
            // زر الرجوع
            Positioned(
              top: 61.h,
              left: 0, // بداية الصفحة مباشرة
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: 24.sp,
                  color: Colors.black,
                ),
              ),
            ),

            // عنوان "My Cases" في المنتصف
            Positioned(
              top: 59.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'My Cases',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                    fontFamily: 'General Sans', // استبدل بخط متاح لديك
                  ),
                ),
              ),
            ),

            // أيقونة الإشعارات
            Positioned(
              top: 61.h,
              right: 0, // أقصى اليمين
              child: GestureDetector(
                onTap: () {
                  // وظيفة عند الضغط
                },
                child: Icon(
                  Icons.notifications_outlined,
                  size: 24.sp,
                  color: Colors.black,
                ),
              ),
            ),

            // زر التبديل
            Positioned(
              top: 112.h,
              left: 24.w,
              child: ToggleButton(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.home,
              label: "Home",
              isActive: _currentTabIndex == 0,
              onTap: () => setState(() => _currentTabIndex = 0),
            ),
            _buildBottomNavItem(
              icon: Icons.search,
              label: "Search",
              isActive: _currentTabIndex == 1,
              onTap: () => setState(() => _currentTabIndex = 1),
            ),
            _buildBottomNavItem(
              icon: Icons.star_border,
              label: "Importants",
              isActive: _currentTabIndex == 2,
              onTap: () => setState(() => _currentTabIndex = 2),
            ),
            _buildBottomNavItem(
              icon: Icons.account_circle_outlined,
              label: "Account",
              isActive: _currentTabIndex == 3,
              onTap: () {
                Get.toNamed('/account');
              },
            ),
            _buildBottomNavItem(
              icon: Icons.shopping_cart_outlined,
              label: "Cart",
              isActive: _currentTabIndex == 4,
              onTap: () => setState(() => _currentTabIndex = 4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.blue : Colors.grey),
          Text(
            label,
            style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.w,
      height: 54.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          _buildToggleOption("Ongoing", true),
          _buildToggleOption("Completed", false),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String text, bool isOngoing) {
    bool isSelected = isOngoing == isOngoingSelected;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOngoingSelected = isOngoing;
          });
        },
        child: Container(
          height: 38.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Color(0xFFE6E6E6),
            borderRadius: BorderRadius.circular(isOngoing ? 6.r : 5.r),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
