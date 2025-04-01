import 'package:get/get.dart';
import 'package:my_case/featuers/user_lawyer_relationship/data/datasources/user_lawyerwith_datasource.dart';
import 'package:my_case/featuers/user_lawyer_relationship/data/repositories/user_lawyerwith_repositories.dart';
import 'package:my_case/featuers/user_lawyer_relationship/presenrtaion/controllers/user_lawyerwith_controller.dart';

class UserLawyerWithBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserLawyerWithRemoteDataSourceImpl());
    Get.put(UserLawyerWithRepositoryImpl(
        Get.find<UserLawyerWithRemoteDataSourceImpl>()));
    Get.put(UserLawyerWithController(Get.find<UserLawyerWithRepositoryImpl>()));
  }
}
