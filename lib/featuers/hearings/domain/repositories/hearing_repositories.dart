import '../entities/hearing.dart';

abstract class HearingRepository {
  Future<Hearing> addHearing(Hearing hearing);
  Future<List<Hearing>> getHearings();
  Future<Hearing> getHearingById(int id);
  Future<void> deleteHearing(int id);
  Future<Hearing> updateHearing(Hearing hearing);
}
