import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_case/featuers/courts/data/datasources/courtRemote_datasource.dart';
import 'package:my_case/featuers/courts/domain/entities/court.dart';
import 'package:my_case/featuers/courts/data/models/court_model.dart';
import 'package:my_case/featuers/courts/domain/repositories/court_repositoreis.dart';

class CourtRepositoryImpl extends CourtRepository {
  final CourtRemoteDataSource remoteDataSource;

  CourtRepositoryImpl(this.remoteDataSource);

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
  Future<List<Court>> getCourts() async {
    return await remoteDataSource.getCourts();
  }

  @override
  Future<Court> addCourt(Court court) async {
    return await remoteDataSource.addCourt(court as CourtModel);
  }

  @override
  Future<Court> updateCourt(Court court) async {
    return await remoteDataSource.updateCourt(court as CourtModel);
  }

  @override
  Future<void> deleteCourt(int id) async {
    await remoteDataSource.deleteCourt(id);
  }
}
