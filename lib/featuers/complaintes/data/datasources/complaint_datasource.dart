import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/complaint_model.dart';

class ComplaintDatasource {
  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/Complaints";

  Future<List<ComplaintModel>> getAllComplaints() async {
    var uri = Uri.parse(baseUrl);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((item) => ComplaintModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load complaints');
    }
  }

  Future<ComplaintModel> getComplaintById(int id) async {
    var uri = Uri.parse("$baseUrl/$id");
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return ComplaintModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load complaint');
    }
  }

  Future<ComplaintModel> addComplaint(ComplaintModel complaint) async {
    var uri = Uri.parse(baseUrl);
    http.Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(complaint.toJson()),
    );

    if (response.statusCode == 201) {
      return ComplaintModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add complaint');
    }
  }

  // Future<ComplaintModel> updateComplaint(ComplaintModel complaint) async {
  //   var uri = Uri.parse("$baseUrl/${complaint.id}");
  //   http.Response response = await http.put(
  //     uri,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode(complaint.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return ComplaintModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to update complaint');
  //   }
  // }

  Future<void> deleteComplaint(int id) async {
    var uri = Uri.parse("$baseUrl/$id");
    http.Response response = await http.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete complaint');
    }
  }
}
