import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_case/featuers/hearings/data/datasources/hearing_datasource.dart';
import 'package:my_case/featuers/hearings/data/repositories/hearing_repositoreis.dart';
import 'package:my_case/featuers/hearings/domain/repositories/hearing_repositories.dart';
import 'package:my_case/featuers/hearings/presenrtaion/controllers/hearing_controller.dart';

class HearingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut<HearingRemoteDataSource>(
      () => HearingRemoteDataSourceImpl(client: Get.find()),
    );
    Get.lazyPut<HearingRepository>(
      () => HearingRepositoryImpl(Get.find()),
    );
    Get.lazyPut<HearingController>(
      () => HearingController(Get.find()),
    );
  }
}
