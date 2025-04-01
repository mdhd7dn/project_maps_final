import 'package:my_case/featuers/roles/domain/entities/role.dart';

abstract class RoleRepository {
  Future<Role> addRole(Role role);
  Future<List<Role>> getRoles();
  Future<Role> getRoleById(String id);
  Future<void> deleteRole(String id);
  Future<Role> updateRole(Role role);
}
