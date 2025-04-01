import '../entities/case.dart';

abstract class CaseRepository {
  Future<Case> addCase(Case caseItem);
  Future<List<Case>> getCases();
  Future<Case> getCaseById(int id);
  Future<void> deleteCase(int id);
  Future<Case> updateCase(Case caseItem);
}
