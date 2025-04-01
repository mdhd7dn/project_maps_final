import 'package:get/get.dart';
import 'package:my_case/featuers/cases/domain/entities/case.dart';
import 'package:my_case/featuers/cases/domain/repositories/case_repositories.dart';

class CaseController extends GetxController {
  final CaseRepository repository;
  CaseController(this.repository);
  RxList<Case> cases = <Case>[].obs;
  RxBool loading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    getCases();
    super.onInit();
  }

  Future<void> getCases() async {
    try {
      loading.value = true;
      error.value = '';
      cases.value = await repository.getCases();
    } catch (e) {
      error.value = e.toString();
      print('Error fetching cases: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> addCase(Case newCase) async {
    try {
      var addedCase = await repository.addCase(newCase);
      cases.add(addedCase);
    } catch (e) {
      print("Error adding case: $e");
    }
  }

  Future<void> updateCase(Case updatedCase) async {
    try {
      var updated = await repository.updateCase(updatedCase);
      var index = cases.indexWhere((c) => c.id == updated.id);
      if (index != -1) {
        cases[index] = updated;
      }
    } catch (e) {
      print("Error updating case: $e");
    }
  }

  Future<void> deleteCase(int id) async {
    try {
      await repository.deleteCase(id);
      cases.removeWhere((c) => c.id == id);
    } catch (e) {
      print("Error deleting case: $e");
    }
  }
}
