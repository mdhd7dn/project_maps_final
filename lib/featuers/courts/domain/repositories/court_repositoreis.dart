import '../entities/court.dart';

abstract class CourtRepository {
  Future<Court> addCourt(Court court);
  Future<List<Court>> getCourts();
  Future<Court> getCourtById(int id);
  Future<void> deleteCourt(int id);
  Future<Court> updateCourt(Court court);
}
