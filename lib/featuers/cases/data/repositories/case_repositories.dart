import 'package:my_case/featuers/cases/data/datasources/case_datasorce.dart';
import 'package:my_case/featuers/cases/domain/entities/case.dart';
import 'package:my_case/featuers/cases/data/models/case_model.dart';
import 'package:my_case/featuers/cases/domain/repositories/case_repositories.dart';

class CaseRepositoryImpl extends CaseRepository {
  final CaseDatasource datasource;

  CaseRepositoryImpl(this.datasource);

  @override
  Future<List<Case>> getCases() async {
    return await datasource.getAllCases();
  }

  @override
  Future<Case> getCaseById(int id) async {
    return await datasource.getCaseById(id);
  }

  @override
  Future<Case> addCase(Case caseItem) async {
    if (caseItem is CaseModel) {
      return await datasource.addCase(caseItem);
    }
    throw Exception('Invalid case type');
  }

  @override
  Future<Case> updateCase(Case updatedCase) async {
    return await datasource.updateCase(updatedCase as CaseModel);
  }

  @override
  Future<void> deleteCase(int id) async {
    await datasource.deleteCase(id);
  }
}
