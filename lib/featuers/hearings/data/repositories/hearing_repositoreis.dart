import 'dart:convert';

import 'package:my_case/featuers/hearings/data/datasources/hearing_datasource.dart';
import 'package:my_case/featuers/hearings/domain/entities/hearing.dart';
import 'package:my_case/featuers/hearings/data/models/hearing_model.dart';
import 'package:my_case/featuers/hearings/domain/repositories/hearing_repositories.dart';
import 'package:http/http.dart' as http;

class HearingRepositoryImpl implements HearingRepository {
  final HearingRemoteDataSource remoteDataSource;

  HearingRepositoryImpl(this.remoteDataSource);

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
  Future<Hearing> getHearingById(int id) async {
    return await remoteDataSource.getHearingById(id);
  }

  @override
  Future<Hearing> addHearing(Hearing hearing) async {
    return await remoteDataSource.addHearing(hearing as HearingModel);
  }

  @override
  Future<Hearing> updateHearing(Hearing hearing) async {
    return await remoteDataSource.updateHearing(hearing as HearingModel);
  }

  @override
  Future<void> deleteHearing(int id) async {
    await remoteDataSource.deleteHearing(id);
  }
}
