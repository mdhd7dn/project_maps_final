import 'package:get/get.dart';
import 'package:my_case/featuers/complaintes/domain/entities/complaint.dart';
import 'package:my_case/featuers/complaintes/domain/repositories/complaint_repositories.dart';

class ComplaintController extends GetxController {
  final ComplaintRepository repository;

  ComplaintController(this.repository);

  RxList<Complaint> complaints = <Complaint>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchComplaints();
    super.onInit();
  }

  Future<void> fetchComplaints() async {
    isLoading.value = true;
    try {
      complaints.value = await repository.getComplaints();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch complaints: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addComplaint(Complaint complaint) async {
    try {
      final newComplaint = await repository.addComplaint(complaint);
      complaints.add(newComplaint);
    } catch (e) {
      Get.snackbar("Error", "Failed to add complaint: $e");
    }
  }

  // Future<void> deleteComplaint(int id) async {
  //   try {
  //     await repository.deleteComplaint(id);
  //     complaints.removeWhere((c) => c.id == id);
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to delete complaint: $e");
  //   }
  // }
}
