import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/consultation_model.dart';

abstract class ConsultationRemoteDataSource {
  Future<List<ConsultationModel>> getConsultations();
  Future<ConsultationModel> getConsultationById(int id);
  Future<ConsultationModel> addConsultation(ConsultationModel consultation);
  Future<ConsultationModel> updateConsultation(ConsultationModel consultation);
  Future<void> deleteConsultation(int id);
}

class ConsultationRemoteDataSourceImpl implements ConsultationRemoteDataSource {
  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/Consultations";

  @override
  Future<List<ConsultationModel>> getConsultations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ConsultationModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch consultations");
    }
  }

  @override
  Future<ConsultationModel> getConsultationById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return ConsultationModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch consultation");
    }
  }

  @override
  Future<ConsultationModel> addConsultation(
      ConsultationModel consultation) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(consultation.toJson()),
    );

    if (response.statusCode == 201) {
      return ConsultationModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add consultation");
    }
  }

  @override
  Future<void> deleteConsultation(int id) {
    // TODO: implement deleteConsultation
    throw UnimplementedError();
  }

  @override
  Future<ConsultationModel> updateConsultation(ConsultationModel consultation) {
    // TODO: implement updateConsultation
    throw UnimplementedError();
  }

  // @override
  // Future<ConsultationModel> updateConsultation(
  //     ConsultationModel consultation) async {
  //   final response = await http.put(
  //     Uri.parse("$baseUrl/${consultation.id}"),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode(consultation.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return ConsultationModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed to update consultation");
  //   }
  // }

//   @override
//   Future<void> deleteConsultation(int id) async {
//     final response = await http.delete(Uri.parse("$baseUrl/$id"));

//     if (response.statusCode != 200) {
//       throw Exception("Failed to delete consultation");
//     }
//   }
// }
}
