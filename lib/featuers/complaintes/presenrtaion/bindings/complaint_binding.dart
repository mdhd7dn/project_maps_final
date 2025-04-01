import 'package:get/get.dart';
import 'package:my_case/featuers/complaintes/data/datasources/complaint_datasource.dart';
import 'package:my_case/featuers/complaintes/data/repositories/complaint_repositories.dart';
import 'package:my_case/featuers/complaintes/domain/repositories/complaint_repositories.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/controllers/complaint_controller.dart';

class ComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintDatasource>(() => ComplaintDatasource(), fenix: true);
    Get.lazyPut<ComplaintRepository>(() => ComplaintRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<ComplaintController>(() => ComplaintController(Get.find()),
        fenix: true);
  }
}
