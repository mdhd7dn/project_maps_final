import 'package:my_case/featuers/roles/data/datasources/role_datasource.dart';
import 'package:my_case/featuers/roles/domain/entities/role.dart';
import 'package:my_case/featuers/roles/data/models/role_model.dart';
import 'package:my_case/featuers/roles/domain/repositories/role_repositories.dart';

class RoleRepositoryImpl extends RoleRepository {
  final RoleRemoteDataSource remoteDataSource;

  RoleRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Role>> getRoles() async {
    return await remoteDataSource.getRoles();
  }

  @override
  Future<Role> getRoleById(String id) async {
    return await remoteDataSource.getRoleById(id);
  }

  @override
  Future<Role> addRole(Role role) async {
    return await remoteDataSource.addRole(role as RoleModel);
  }

  @override
  Future<Role> updateRole(Role role) async {
    return await remoteDataSource.updateRole(role as RoleModel);
  }

  @override
  Future<void> deleteRole(String id) async {
    await remoteDataSource.deleteRole(id);
  }
}
