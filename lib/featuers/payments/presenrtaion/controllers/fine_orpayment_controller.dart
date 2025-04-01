import 'package:get/get.dart';
import 'package:my_case/featuers/payments/data/repositories/fine_orpayment_repositories.dart';
import 'package:my_case/featuers/payments/domain/entities/payment.dart';

class FineOrPaymentController extends GetxController {
  final FineOrPaymentRepositoryImpl repository;

  FineOrPaymentController(this.repository);

  RxList<FineOrPayment> finesOrPayments = <FineOrPayment>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getFinesOrPayments();
    super.onInit();
  }

  Future<void> getFinesOrPayments() async {
    try {
      loading.value = true;
      finesOrPayments.value = await repository.getFinesOrPayments();
    } finally {
      loading.value = false;
    }
  }

  Future<void> addFineOrPayment(FineOrPayment newFine) async {
    try {
      var addedFine = await repository.addFineOrPayment(newFine);
      finesOrPayments.add(addedFine);
    } catch (e) {
      print("Error adding fine/payment: $e");
    }
  }

  Future<void> updateFineOrPayment(FineOrPayment updatedFine) async {
    try {
      var updated = await repository.updateFineOrPayment(updatedFine);
      var index = finesOrPayments.indexWhere((f) => f.id == updated.id);
      if (index != -1) {
        finesOrPayments[index] = updated;
      }
    } catch (e) {
      print("Error updating fine/payment: $e");
    }
  }

  Future<void> deleteFineOrPayment(int id) async {
    try {
      await repository.deleteFineOrPayment(id);
      finesOrPayments.removeWhere((f) => f.id == id);
    } catch (e) {
      print("Error deleting fine/payment: $e");
    }
  }
}
