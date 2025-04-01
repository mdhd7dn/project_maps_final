import 'package:get/get.dart';
import 'package:my_case/featuers/cases/data/datasources/case_datasorce.dart';
import 'package:my_case/featuers/cases/data/repositories/case_repositories.dart';
import 'package:my_case/featuers/cases/domain/repositories/case_repositories.dart';
import 'package:my_case/featuers/cases/presenrtaion/controllers/case_controller.dart';

class CaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaseDatasource>(() => CaseDatasource(), fenix: true);
    Get.lazyPut<CaseRepository>(() => CaseRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<CaseController>(() => CaseController(Get.find()), fenix: true);
  }
}
