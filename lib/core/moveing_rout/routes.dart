import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/featuers/cases/presenrtaion/bindings/casebinding.dart';
import 'package:my_case/featuers/cases/presenrtaion/pages/case_screen.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/account_screen.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/enter_digit_code.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/homepage.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/login_screen.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/onepage_screen.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/register_screen.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/rest_password.dart';
import 'package:my_case/featuers/users/presenrtaion/pages/auth/restpassword_andemail.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoutes.login,
    page: () => LoginScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.onepage,
    page: () => OnepageScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => Register(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.restpassword,
    page: () => const RestPassword(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.enterDigitCode,
    page: () => EnterDigitCode(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.restpasswordandemail,
    page: () => ResetPasswordScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: AppRoutes.cases,
    page: () => CaseScreen(),
    binding: CaseBinding(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: AppRoutes.account,
    page: () => AccountScreen(),
    transition: Transition.zoom,
  )
];
