import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_case/core/appbindings.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/core/moveing_rout/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // testConnection();
  // testCaseConnection();
  // testComplaintsConnection();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 845),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: const Locale('ar', 'SA'),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialBinding: UserBinding(),
      initialRoute: AppRoutes.onepage,
      getPages: getPages,
      initialBinding: AppBindings(),
    );
  }
}

Future<void> testComplaintsConnection() async {
  try {
    final response = await http.get(
      Uri.parse('http://samerabosamra-001-site1.mtempurl.com/api/Complaints'),
      headers: {'Content-Type': 'application/json'},
    );

    print('=== Complaints API Connection Test ===');
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Number of complaints: ${data.length}');
      print('First complaint: ${data.isNotEmpty ? data[0] : 'No complaints'}');
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

// void testConnection() async {
//   try {
//     final response = await http.get(
//       Uri.parse('http://samerabosamra-001-site1.mtempurl.com'),
//     );
//     print('Connection test: ${response.statusCode}');
//   } catch (e) {
//     print('Connection failed: $e');
//   }
// // }

// Future<void> testCaseConnection() async {
//   try {
//     final response = await http.get(
//       Uri.parse('http://samerabosamra-001-site1.mtempurl.com/api/Case'),
//       headers: {'Content-Type': 'application/json'},
//     );

//     print('=== API Connection Test ===');
//     print('Status Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print('Number of cases: ${data.length}');
//       print('First case: ${data.isNotEmpty ? data[0] : 'No cases'}');
//     } else {
//       print('Error: ${response.reasonPhrase}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }
