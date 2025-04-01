import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_case/core/services/auth_service.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  // Future<List<UserModel>> getUsers();
  // Future<UserModel> getUserById(String id);
  // Future<UserModel> addUser(UserModel user);
  // Future<UserModel> updateUser(UserModel user);
  // Future<void> deleteUser(String id);
  Future<bool> login(String email, String password) async {
    final String url =
        "http://samerabosamra-001-site1.mtempurl.com/api/Account/login";
    print("📤 Sending login request to: $url");

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    final Map<String, dynamic> body = {
      "email": email.trim(),
      "password": password.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      print("📥 Response Status: ${response.statusCode}");
      print("📥 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String token = data["token"];

        await AuthService.saveToken(token);

        print("✅ Token saved successfully!");
        return true;
      } else {
        print("❌ Login failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print("❌ Error in login request: $e");
      return false;
    }
  }

  @override
  Future<UserModel> register(UserModel user, String password) async {
    final response = await http.post(
      Uri.parse(
          "http://samerabosamra-001-site1.mtempurl.com/api/Account/register"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": user.name,
        "email": user.email,
        "faceOfTheCard": user.faceOfTheCard,
        "password": password,
        "confirmPassword": password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Registration failed: ${response.statusCode}');
    }
  }
}  // final String baseUrl = "http://samerabosamra-001-site1.mtempurl.com/api/";
  // final String authUrl = "https://yourapi.com/api/auth"; 

  // @override
  // Future<List<UserModel>> getUsers() async {
  //   final response = await http.get(Uri.parse("http://samerabosamra-001-site1.mtempurl.com/api/"));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((json) => UserModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to fetch Users");
  //   }
  // }

  // @override
  // Future<UserModel> getUserById(String id) async {
  //   final response = await http.get(Uri.parse("$baseUrl/$id"));
  //   if (response.statusCode == 200) {
  //     return UserModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed to fetch User");
  //   }
  // }

  // @override
  // Future<UserModel> addUser(UserModel user) async {
  //   final response = await http.post(
  //     Uri.parse("http://samerabosamra-001-site1.mtempurl.com/api/Account/Register"),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode(user.toJson()),
  //   );
  //   if (response.statusCode == 201) {
  //     return UserModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed to add User");
  //   }
  // }

  // @override
  // Future<UserModel> updateUser(UserModel user) async {
  //   final response = await http.put(
  //     Uri.parse("$baseUrl/${user.id}"),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode(user.toJson()),
  //   );
  //   if (response.statusCode == 200) {
  //     return UserModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed to update User");
  //   }
  // }

  // @override
  // Future<void> deleteUser(String id) async {
  //   final response = await http.delete(Uri.parse("$baseUrl/$id"));
  //   if (response.statusCode != 200) {
  //     throw Exception("Failed to delete User");
  //   }
  // }
