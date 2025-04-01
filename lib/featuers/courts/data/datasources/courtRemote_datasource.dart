import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/court_model.dart';

abstract class CourtRemoteDataSource {
  Future<List<CourtModel>> getCourts();
  Future<CourtModel> getCourtById(int id);
  Future<CourtModel> addCourt(CourtModel court);
  Future<CourtModel> updateCourt(CourtModel court);
  Future<void> deleteCourt(int id);
}

class CourtRemoteDataSourceImpl implements CourtRemoteDataSource {
  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/Courts";
  Future<CourtModel> getCourtById(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/GetById?id=$id"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return CourtModel.fromJson(responseData);
    } else if (response.statusCode == 404) {
      throw Exception("المحكمة غير موجودة");
    } else {
      throw Exception(
          "فشل في جلب بيانات المحكمة. رمز الخطأ: ${response.statusCode}");
    }
  }

  @override
  Future<List<CourtModel>> getCourts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CourtModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch courts");
    }
  }

  @override
  Future<CourtModel> addCourt(CourtModel court) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(court.toJson()),
    );

    if (response.statusCode == 201) {
      return CourtModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add court");
    }
  }

  @override
  Future<CourtModel> updateCourt(CourtModel court) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${court.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(court.toJson()),
    );

    if (response.statusCode == 200) {
      return CourtModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update court");
    }
  }

  @override
  Future<void> deleteCourt(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete court");
    }
  }
}
