import 'package:get/get.dart';
import 'package:my_case/featuers/users/data/datasources/user_datasource.dart';
import 'package:my_case/featuers/users/data/repositories/user_repositories.dart';
import 'package:my_case/featuers/users/presenrtaion/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRemoteDataSource());
    Get.lazyPut(() => UserRepositoryImpl(Get.find()));
    Get.lazyPut(() => UserController(Get.find()));
  }
}
