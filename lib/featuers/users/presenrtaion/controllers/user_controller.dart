import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:my_case/core/moveing_rout/approutes.dart';
import 'package:my_case/core/services/auth_service.dart';
import 'package:my_case/featuers/users/data/models/user_model.dart';
import 'package:my_case/featuers/users/data/repositories/user_repositories.dart';

class UserController extends GetxController {
  final UserRepositoryImpl repository;
  UserController(this.repository);

  bool _loading = false;
  bool get loading => _loading;

  String _token = "";
  String get token => _token;

  Future<void> register(UserModel user, String password) async {
    _loading = true;
    update();

    try {
      print('Sending registration data: ${user.toJson()}');

      final response = await http.post(
        Uri.parse(
            "http://samerabosamra-001-site1.mtempurl.com/api/Account/register"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode({
          "name": user.name,
          "email": user.email,
          "faceOfTheCard": user.faceOfTheCard,
          "password": password,
          "confirmPassword": password,
        }),
      );

      print('Raw response: ${response.body}');

      if (response.body.contains("Account created successfully")) {
        Get.offAllNamed(AppRoutes.home);
        return;
      }

      try {
        final responseData = json.decode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.offAllNamed(AppRoutes.home);
        } else {
          throw Exception(responseData['message'] ?? 'Registration failed');
        }
      } catch (e) {
        throw Exception("Success but couldn't parse response");
      }
    } catch (e) {
      print('Registration error: $e');
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _loading = false;
      update();
    }
  }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     // _loading = true;
  //     update();

  //     // final LoginResult result = await FacebookAuth.instance.login();
  //     // final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
  //     // await FirebaseAuth.instance.signInWithCredential(credential);

  //     // _loading = false;
  //     update();
  //     // Get.offAllNamed(AppRoutes.home);
  //   } catch (e) {
  //     // _loading = false;
  //     update();
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     // _loading = true;
  //     update();

  //     // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     // final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  //     // final credential = GoogleAuthProvider.credential(
  //     //   accessToken: googleAuth.accessToken,
  //     //   idToken: googleAuth.idToken,
  //     // );
  //     // await FirebaseAuth.instance.signInWithCredential(credential);

  //     // _loading = false;
  //     update();
  //     // Get.offAllNamed(AppRoutes.home);
  //   } catch (e) {
  //     // _loading = false;
  //     update();
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  Future<void> login(String email, String password) async {
    _loading = true;
    update();

    try {
      final response = await http.post(
        Uri.parse(
            'http://samerabosamra-001-site1.mtempurl.com/api/Account/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _token = data['token'] ?? "";
        await AuthService.saveToken(_token);
        Get.to(AppRoutes.home);
      } else {
        // Get.snackbar("Error", "Login failed: ${response.body}");
        Get.to(AppRoutes.home);
      }
    } catch (e) {
      // Get.snackbar("Error", "Exception: $e");
      Get.offAllNamed(AppRoutes.home);
    } finally {
      _loading = false;
      update();
    }
  }
} // Future<void> getUsers() async {
  //   try {
  //     loading.value = true;
  //     users.value = await repository.getUsers();
  //   } finally {
  //     loading.value = false;
  //   }
  // }

  // Future<void> addUser(User newUser) async {
  //   try {
  //     var addedUser = await repository.addUser(newUser);
  //     users.add(addedUser);
  //   } catch (e) {
  //     print("Error adding user: $e");
  //   }
  // }

  // Future<void> updateUser(User updatedUser) async {
  //   try {
  //     var updated = await repository.updateUser(updatedUser);
  //     var index = users.indexWhere((u) => u.id == updated.id);
  //     if (index != -1) {
  //       users[index] = updated;
  //     }
  //   } catch (e) {
  //     print("Error updating user: $e");
  //   }
  // }

  // Future<void> deleteUser(String id) async {
  //   try {
  //     await repository.deleteUser(id);
  //     users.removeWhere((u) => u.id == id);
  //   } catch (e) {
  //     print("Error deleting user: $e");
  //   }
  // }
// }