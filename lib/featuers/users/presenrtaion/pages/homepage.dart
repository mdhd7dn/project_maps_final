import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/featuers/cases/presenrtaion/controllers/case_controller.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/controllers/complaint_controller.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/controllers/consultation_controller.dart';
import 'package:my_case/featuers/courts/presenrtaion/controllers/court_controller.dart';
import 'package:my_case/featuers/documents/presenrtaion/controllers/document_controller.dart';
import 'package:my_case/featuers/hearings/presenrtaion/controllers/hearing_controller.dart';

import 'package:my_case/featuers/cases/presenrtaion/pages/cases_content.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/pages/complaints_content.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/pages/consultations_content.dart';
import 'package:my_case/featuers/courts/presenrtaion/pages/courts_content.dart';
import 'package:my_case/featuers/documents/presenrtaion/pages/documents_content.dart';
import 'package:my_case/featuers/hearings/presenrtaion/pages/hearings_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _currentTabIndex = 0;
  final CaseController _caseController = Get.find();
  final ComplaintController _complaintController = Get.find();
  final ConsultationController _consultationController = Get.find();
  final CourtController _courtController = Get.find();
  final DocumentController _documentController = Get.find();
  final HearingController _hearingController = Get.find();
  final TextEditingController _documentIdController = TextEditingController();
  final TextEditingController _courtIdController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    "All",
    "Cases",
    "Consultations",
    "Courts",
    "Files",
    "Complaintes",
    "Hearinges",
    "FineOrPaymentes",
    "Rolees",
    "Lawyeres"
  ];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    if (_selectedCategoryIndex == 1) {
      _caseController.getCases();
    } else if (_selectedCategoryIndex == 2) {
      _consultationController.getConsultations();
    } else if (_selectedCategoryIndex == 6) {
      _hearingController.fetchHearings();
    } else if (_selectedCategoryIndex == 5) {
      _complaintController.fetchComplaints();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 59.h),
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildSearchField(),
            SizedBox(height: 16.h),
            _buildCategoryButtons(),
            Expanded(child: _buildContentSection()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Legal Consultations",
          style: TextStyle(
            fontFamily: "General Sans",
            fontWeight: FontWeight.w600,
            fontSize: 32.sp,
            height: 1.0,
            letterSpacing: -0.05,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        Icon(Icons.notifications_none, color: const Color(0xFF1A1A1A)),
      ],
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: 342.w,
      height: 52.h,
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Color(0xFFE6E6E6),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
          hintText: "Search for legal topics...",
          hintStyle: TextStyle(
            color: const Color(0xFFB3B3B3),
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(Icons.search, color: const Color(0xFFB3B3B3)),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: IconButton(
              icon: Icon(Icons.clear, color: const Color(0xFFB3B3B3)),
              onPressed: () {
                _searchController.clear();
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index < categories.length - 1 ? 10.w : 0),
            child: _buildCategoryButton(
              text: categories[index],
              isSelected: _selectedCategoryIndex == index,
              onPressed: () {
                setState(() => _selectedCategoryIndex = index);
                _loadDataForCategory(index);
              },
            ),
          );
        }),
      ),
    );
  }

  void _loadDataForCategory(int index) {
    switch (index) {
      case 1:
        _caseController.getCases();
        break;
      case 2:
        _consultationController.getConsultations();
        break;
      case 6:
        _hearingController.fetchHearings();
        break;
      case 5:
        _complaintController.fetchComplaints();
        break;
    }
  }

  Widget _buildContentSection() {
    final searchQuery = _searchController.text.toLowerCase();

    Widget content;
    switch (_selectedCategoryIndex) {
      case 1:
        content = CasesContent(searchQuery: searchQuery);
        break;
      case 2:
        content = ConsultationsContent(searchQuery: searchQuery);
        break;
      case 3:
        content = CourtsContent();
        break;
      case 4:
        content = DocumentsContent();
        break;
      case 5:
        content = ComplaintsContent();
        break;
      case 6:
        content = HearingsContent();
        break;
      default:
        content = Center(
          child: Text("Selected: ${categories[_selectedCategoryIndex]}",
              style:
                  TextStyle(fontSize: 16.sp, color: const Color(0xFF808080))),
        );
    }

    return content;
  }

  Widget _buildCategoryButton({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 36.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF1A1A1A) : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF1A1A1A),
          side: const BorderSide(
            color: Color(0xFFE6E6E6),
            width: 1,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 20.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "General Sans",
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 86.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE6E6E6),
            width: 1.h,
          ),
        ),
      ),
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
              Get.toNamed(AppRoutes.account);
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
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.h,
            color: isActive ? const Color(0xFF1A1A1A) : const Color(0xFFB3B3B3),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color:
                  isActive ? const Color(0xFF1A1A1A) : const Color(0xFFB3B3B3),
            ),
          ),
        ],
      ),
    );
  }
}
