import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressCourts extends StatefulWidget {
  const AddressCourts({super.key});

  @override
  _AddressCourtsState createState() => _AddressCourtsState();
}

class _AddressCourtsState extends State<AddressCourts> {
  int _selectedAddressIndex = 0;

  final List<String> addresses = [
    "Home",
    "Office",
    "Apartment",
    "Parent’s House"
  ];

  final List<String> addressDetails = [
    "925 S Chugach St #APT 10, Alaska",
    "2438 6th Ave, Ketchikan, Alaska",
    "2551 Vista Dr #B301, Juneau, Alaska",
    "4821 Ridge Top Cir, Anchorage, Alaska"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address",
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
            Text("Saved Address",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.black54),
                      title: Text(addresses[index],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(addressDetails[index]),
                      trailing: Radio(
                        value: index,
                        groupValue: _selectedAddressIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedAddressIndex = value!;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.black),
              label: Text("Add New Address",
                  style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Get.snackbar(
                    "Success",
                    "Address Applied Successfully",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    icon: Icon(Icons.check_circle, color: Colors.white),
                  );
                },
                child: Text("Apply",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
