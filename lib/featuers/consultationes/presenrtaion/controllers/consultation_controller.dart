import 'package:get/get.dart';
import 'package:my_case/featuers/consultationes/data/repositories/consultation_repositories.dart';
import 'package:my_case/featuers/consultationes/domain/entities/consulation.dart';

class ConsultationController extends GetxController {
  final ConsultationRepositoryImpl repository;

  ConsultationController(this.repository);

  RxList<Consultation> consultations = <Consultation>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getConsultations();
    super.onInit();
  }

  Future<void> getConsultations() async {
    try {
      loading.value = true;
      consultations.value = await repository.getConsultations();
    } finally {
      loading.value = false;
    }
  }

  Future<void> addConsultation(Consultation newConsultation) async {
    try {
      var addedConsultation = await repository.addConsultation(newConsultation);
      consultations.add(addedConsultation);
    } catch (e) {
      print("Error adding consultation: $e");
    }
  }

  // Future<void> updateConsultation(Consultation updatedConsultation) async {
  //   try {
  //     var updated = await repository.updateConsultation(updatedConsultation);
  //     var index = consultations.indexWhere((c) => c.id == updated.id);
  //     if (index != -1) {
  //       consultations[index] = updated;
  //     }
  //   } catch (e) {
  //     print("Error updating consultation: $e");
  //   }
  // }

//   Future<void> deleteConsultation(int id) async {
//     try {
//       await repository.deleteConsultation(id);
//       consultations.removeWhere((c) => c.id == id);
//     } catch (e) {
//       print("Error deleting consultation: $e");
//     }
//   }
// }
}
