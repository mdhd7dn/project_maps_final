import 'package:get/get.dart';
import 'package:my_case/featuers/payments/data/datasources/fineorpayment_datasource.dart';
import 'package:my_case/featuers/payments/data/repositories/fine_orpayment_repositories.dart';
import 'package:my_case/featuers/payments/presenrtaion/controllers/fine_orpayment_controller.dart';

class FineOrPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FineOrPaymentRemoteDataSourceImpl());
    Get.put(FineOrPaymentRepositoryImpl(
        Get.find<FineOrPaymentRemoteDataSourceImpl>()));
    Get.put(FineOrPaymentController(Get.find<FineOrPaymentRepositoryImpl>()));
  }
}
