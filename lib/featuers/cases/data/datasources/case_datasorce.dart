import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/case_model.dart';

class CaseDatasource {
  final String baseUrl = 'http://samerabosamra-001-site1.mtempurl.com/api/Case';

  Future<List<CaseModel>> getAllCases() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        try {
          final List<dynamic> jsonResponse = json.decode(response.body);
          return jsonResponse.map((data) => CaseModel.fromJson(data)).toList();
        } catch (e) {
          print('JSON Parsing Error: $e');
          throw Exception('Failed to parse cases data');
        }
      } else {
        throw Exception('Failed to load cases: ${response.statusCode}');
      }
    } catch (e) {
      print('Network Error: $e');
      rethrow;
    }
  }

  //  جلب قضية واحدة عبر ID
  Future<CaseModel> getCaseById(int id) async {
    var uri = Uri.parse("$baseUrl/$id");

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return CaseModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load case');
    }
  }

  Future<CaseModel> addCase(CaseModel newCase) async {
    var uri = Uri.parse(baseUrl);

    http.Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(newCase.toJson()),
    );

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return CaseModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to add case');
    }
  }

  //  تحديث قضية موجودة
  Future<CaseModel> updateCase(CaseModel updatedCase) async {
    var uri = Uri.parse("$baseUrl/${updatedCase.id}");

    http.Response response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(updatedCase.toJson()),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return CaseModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to update case');
    }
  }

  Future<void> deleteCase(int id) async {
    var uri = Uri.parse("$baseUrl/$id");

    http.Response response = await http.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete case');
    }
  }
}
