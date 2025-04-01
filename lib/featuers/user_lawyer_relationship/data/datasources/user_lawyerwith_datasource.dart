import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_case/featuers/user_lawyer_relationship/data/models/user_lawyerwith_model.dart';

abstract class UserLawyerWithRemoteDataSource {
  Future<List<UserLawyerWithModel>> getUserLawyerWiths();
  Future<UserLawyerWithModel> getUserLawyerWithById(int id);
  Future<UserLawyerWithModel> addUserLawyerWith(
      UserLawyerWithModel userLawyerWith);
  Future<UserLawyerWithModel> updateUserLawyerWith(
      UserLawyerWithModel userLawyerWith);
  Future<void> deleteUserLawyerWith(int id);
}

class UserLawyerWithRemoteDataSourceImpl
    implements UserLawyerWithRemoteDataSource {
  final String baseUrl =
      "https://yourapi.com/api/userLawyerWiths"; // 🔹 غيّر هذا بالـ API الخاص بك

  @override
  Future<List<UserLawyerWithModel>> getUserLawyerWiths() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserLawyerWithModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch UserLawyerWiths");
    }
  }

  @override
  Future<UserLawyerWithModel> getUserLawyerWithById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return UserLawyerWithModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch UserLawyerWith");
    }
  }

  @override
  Future<UserLawyerWithModel> addUserLawyerWith(
      UserLawyerWithModel userLawyerWith) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(userLawyerWith.toJson()),
    );

    if (response.statusCode == 201) {
      return UserLawyerWithModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add UserLawyerWith");
    }
  }

  @override
  Future<UserLawyerWithModel> updateUserLawyerWith(
      UserLawyerWithModel userLawyerWith) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${userLawyerWith.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(userLawyerWith.toJson()),
    );

    if (response.statusCode == 200) {
      return UserLawyerWithModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update UserLawyerWith");
    }
  }

  @override
  Future<void> deleteUserLawyerWith(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete UserLawyerWith");
    }
  }
}
