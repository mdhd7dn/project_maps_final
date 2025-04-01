import 'package:get/get.dart';
import 'package:my_case/featuers/roles/data/datasources/role_datasource.dart';
import 'package:my_case/featuers/roles/data/repositories/role_repositories.dart';
import 'package:my_case/featuers/roles/presenrtaion/controllers/role_controller.dart';

class RoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoleRemoteDataSourceImpl());
    Get.put(RoleRepositoryImpl(Get.find<RoleRemoteDataSourceImpl>()));
    Get.put(RoleController(Get.find<RoleRepositoryImpl>()));
  }
}
