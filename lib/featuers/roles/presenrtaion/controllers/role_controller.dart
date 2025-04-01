import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_case/featuers/roles/data/repositories/role_repositories.dart';
import 'package:my_case/featuers/roles/domain/entities/role.dart';

class RoleController extends GetxController {
  final RoleRepositoryImpl repository;

  RoleController(this.repository);

  RxList<Role> roles = <Role>[].obs;
  RxBool loading = false.obs;
  Rx<Role?> role = Rx<Role?>(null);
  TextEditingController idController = TextEditingController();

  Future<void> getRoleById(String id) async {
    try {
      loading.value = true;
      role.value = await repository.getRoleById(id);
    } catch (e) {
      print("Error fetching role: $e");
      Get.snackbar('Error', 'Failed to fetch role');
    } finally {
      loading.value = false;
    }
  }
}
