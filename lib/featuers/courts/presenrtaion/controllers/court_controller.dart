import 'package:get/get.dart';
import 'package:my_case/featuers/courts/data/models/court_model.dart';
import 'package:my_case/featuers/courts/data/repositories/court_repositories.dart';
import 'package:my_case/featuers/courts/domain/entities/court.dart';

class CourtController extends GetxController {
  final CourtRepositoryImpl repository;

  CourtController(this.repository);

  RxList<Court> courts = <Court>[].obs;
  Rx<CourtModel?> currentCourt = Rx<CourtModel?>(null);
  RxBool loading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getCourtById(int id) async {
    try {
      print("🔍 جلب المحكمة بالرقم: $id");
      loading.value = true;
      error.value = '';

      var court = await repository.getCourtById(id);
      print("✅ المحكمة تم جلبها: ${court.name}");

      currentCourt.value = court;
    } catch (e) {
      error.value = e.toString();
      print("❌ خطأ في جلب المحكمة: $e");
    } finally {
      loading.value = false;
    }
  }

  Future<void> getCourts() async {
    try {
      loading.value = true;
      courts.value = await repository.getCourts();
    } finally {
      loading.value = false;
    }
  }

  Future<void> addCourt(Court newCourt) async {
    try {
      var addedCourt = await repository.addCourt(newCourt);
      courts.add(addedCourt);
    } catch (e) {
      print("Error adding court: $e");
    }
  }

  Future<void> updateCourt(Court updatedCourt) async {
    try {
      var updated = await repository.updateCourt(updatedCourt);
      var index = courts.indexWhere((c) => c.id == updated.id);
      if (index != -1) {
        courts[index] = updated;
      }
    } catch (e) {
      print("Error updating court: $e");
    }
  }

  Future<void> deleteCourt(int id) async {
    try {
      await repository.deleteCourt(id);
      courts.removeWhere((c) => c.id == id);
    } catch (e) {
      print("Error deleting court: $e");
    }
  }

  searchCourts(String input) {}
}
