import 'package:get/get.dart';
import 'package:my_case/featuers/consultationes/data/datasources/consultation_datasource.dart';
import 'package:my_case/featuers/consultationes/data/repositories/consultation_repositories.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/controllers/consultation_controller.dart';

class ConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConsultationRemoteDataSourceImpl());
    Get.put(ConsultationRepositoryImpl(
        Get.find<ConsultationRemoteDataSourceImpl>()));
    Get.put(ConsultationController(Get.find<ConsultationRepositoryImpl>()));
  }
}
