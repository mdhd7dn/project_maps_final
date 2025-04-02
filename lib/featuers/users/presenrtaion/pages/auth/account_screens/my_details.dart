import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDetails extends StatefulWidget {
  const MyDetails({super.key});

  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  int _currentTabIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Details",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Full Name", "Cody Fisher"),
            SizedBox(height: 12.h),
            _buildTextField("Email Address", "cody.fisher45@example"),
            SizedBox(height: 12.h),
            _buildDateField("Date of Birth", "12/07/1990"),
            SizedBox(height: 12.h),
            _buildDropdownField("Gender", "Male"),
            SizedBox(height: 12.h),
            _buildPhoneField("Phone Number", "+1 234 453 231 506"),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Get.snackbar(
                    "Success",
                    "Done",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    icon: Icon(Icons.check_circle, color: Colors.white),
                  );
                },
                child: Text("Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
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

  Widget _buildTextField(String label, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      controller: TextEditingController(text: initialValue),
    );
  }

  Widget _buildDateField(String label, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(text: initialValue),
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      value: value,
      items: ["Male", "Female"]
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (val) {},
    );
  }

  Widget _buildPhoneField(String label, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: Text("🇺🇸", style: TextStyle(fontSize: 18.sp)),
        ),
      ),
      controller: TextEditingController(text: initialValue),
      keyboardType: TextInputType.phone,
    );
  }
}
