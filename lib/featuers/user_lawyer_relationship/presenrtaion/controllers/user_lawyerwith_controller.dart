import 'package:get/get.dart';
import 'package:my_case/featuers/user_lawyer_relationship/data/repositories/user_lawyerwith_repositories.dart';
import 'package:my_case/featuers/user_lawyer_relationship/domain/entities/user_lawyer_relationship.dart';

class UserLawyerWithController extends GetxController {
  final UserLawyerWithRepositoryImpl repository;

  UserLawyerWithController(this.repository);

  RxList<UserLawyerWith> userLawyerWiths = <UserLawyerWith>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getUserLawyerWiths();
    super.onInit();
  }

  Future<void> getUserLawyerWiths() async {
    try {
      loading.value = true;
      userLawyerWiths.value = await repository.getUserLawyerWiths();
    } finally {
      loading.value = false;
    }
  }

  Future<void> addUserLawyerWith(UserLawyerWith newUserLawyerWith) async {
    try {
      var added = await repository.addUserLawyerWith(newUserLawyerWith);
      userLawyerWiths.add(added);
    } catch (e) {
      print("Error adding UserLawyerWith: $e");
    }
  }

  Future<void> updateUserLawyerWith(
      UserLawyerWith updatedUserLawyerWith) async {
    try {
      var updated =
          await repository.updateUserLawyerWith(updatedUserLawyerWith);
      var index = userLawyerWiths.indexWhere((u) => u.id == updated.id);
      if (index != -1) {
        userLawyerWiths[index] = updated;
      }
    } catch (e) {
      print("Error updating UserLawyerWith: $e");
    }
  }

  Future<void> deleteUserLawyerWith(int id) async {
    try {
      await repository.deleteUserLawyerWith(id);
      userLawyerWiths.removeWhere((u) => u.id == id);
    } catch (e) {
      print("Error deleting UserLawyerWith: $e");
    }
  }
}
