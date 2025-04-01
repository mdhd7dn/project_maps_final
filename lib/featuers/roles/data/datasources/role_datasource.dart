import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/role_model.dart';

abstract class RoleRemoteDataSource {
  Future<List<RoleModel>> getRoles();
  Future<RoleModel> getRoleById(String id);
  Future<RoleModel> addRole(RoleModel role);
  Future<RoleModel> updateRole(RoleModel role);
  Future<void> deleteRole(String id);
}

class RoleRemoteDataSourceImpl implements RoleRemoteDataSource {
  final String baseUrl = "https://yourapi.com/api/roles";

  @override
  Future<List<RoleModel>> getRoles() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => RoleModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch roles");
    }
  }

  @override
  Future<RoleModel> getRoleById(String id) async {
    final response = await http.get(Uri.parse(
        "http://samerabosamra-001-site1.mtempurl.com/api/AsinRoleToUser/GetUserRolesById?userId=$id"));

    if (response.statusCode == 200) {
      return RoleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch role");
    }
  }

  @override
  Future<RoleModel> addRole(RoleModel role) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(role.toJson()),
    );

    if (response.statusCode == 201) {
      return RoleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add role");
    }
  }

  @override
  Future<RoleModel> updateRole(RoleModel role) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${role.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(role.toJson()),
    );

    if (response.statusCode == 200) {
      return RoleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update role");
    }
  }

  @override
  Future<void> deleteRole(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete role");
    }
  }
}
