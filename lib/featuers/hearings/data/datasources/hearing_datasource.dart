import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hearing_model.dart';

abstract class HearingRemoteDataSource {
  Future<List<HearingModel>> getHearings();
  Future<HearingModel> getHearingById(int id);
  Future<HearingModel> addHearing(HearingModel hearing);
  Future<HearingModel> updateHearing(HearingModel hearing);
  Future<void> deleteHearing(int id);
}

class HearingRemoteDataSourceImpl implements HearingRemoteDataSource {
  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/hearings";
  final http.Client client;

  HearingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HearingModel>> getHearings() async {
    try {
      final response = await http.get(Uri.parse(
          'http://samerabosamra-001-site1.mtempurl.com/api/hearings'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => HearingModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load hearings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching hearings: $e');
    }
  }

  @override
  Future<HearingModel> getHearingById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return HearingModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch hearing");
    }
  }

  @override
  Future<HearingModel> addHearing(HearingModel hearing) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(hearing.toJson()),
    );

    if (response.statusCode == 201) {
      return HearingModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add hearing");
    }
  }

  // @override
  // Future<HearingModel> updateHearing(HearingModel hearing) async {
  //   final response = await http.put(
  //     Uri.parse("$baseUrl/${hearing.id}"),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode(hearing.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return HearingModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed to update hearing");
  //   }
  // }

  @override
  Future<void> deleteHearing(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete hearing");
    }
  }

  @override
  Future<HearingModel> updateHearing(HearingModel hearing) {
    // TODO: implement updateHearing
    throw UnimplementedError();
  }
}
