import 'package:get/get.dart';
import 'package:my_case/featuers/courts/data/datasources/courtRemote_datasource.dart';
import 'package:my_case/featuers/courts/data/repositories/court_repositories.dart';
import 'package:my_case/featuers/courts/presenrtaion/controllers/court_controller.dart';

class CourtBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourtRemoteDataSourceImpl());
    Get.put(CourtRepositoryImpl(Get.find<CourtRemoteDataSourceImpl>()));
    Get.put(CourtController(Get.find<CourtRepositoryImpl>()));
  }
}
