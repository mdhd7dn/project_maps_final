import 'package:my_case/featuers/user_lawyer_relationship/data/datasources/user_lawyerwith_datasource.dart';
import 'package:my_case/featuers/user_lawyer_relationship/domain/entities/user_lawyer_relationship.dart';
import 'package:my_case/featuers/user_lawyer_relationship/data/models/user_lawyerwith_model.dart';

class UserLawyerWithRepositoryImpl extends UserLawyerWith {
  final UserLawyerWithRemoteDataSource remoteDataSource;

  UserLawyerWithRepositoryImpl(this.remoteDataSource)
      : super(id: 0, userId: '', courtsId: 0, caseId: 0);

  Future<List<UserLawyerWith>> getUserLawyerWiths() async {
    return await remoteDataSource.getUserLawyerWiths();
  }

  Future<UserLawyerWith> getUserLawyerWithById(int id) async {
    return await remoteDataSource.getUserLawyerWithById(id);
  }

  Future<UserLawyerWith> addUserLawyerWith(
      UserLawyerWith userLawyerWith) async {
    return await remoteDataSource
        .addUserLawyerWith(userLawyerWith as UserLawyerWithModel);
  }

  Future<UserLawyerWith> updateUserLawyerWith(
      UserLawyerWith userLawyerWith) async {
    return await remoteDataSource
        .updateUserLawyerWith(userLawyerWith as UserLawyerWithModel);
  }

  Future<void> deleteUserLawyerWith(int id) async {
    await remoteDataSource.deleteUserLawyerWith(id);
  }
}
