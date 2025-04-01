import 'package:my_case/featuers/users/data/datasources/user_datasource.dart';
import 'package:my_case/featuers/users/data/models/user_model.dart';
import 'package:my_case/featuers/users/domain/entities/user.dart';
import 'package:my_case/featuers/users/domain/repositories/user_repositories.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> login(String email, String password) async {
    try {
      bool success = await remoteDataSource.login(email, password);
      return success;
    } catch (e) {
      print("❌ Error in login: $e");
      return false;
    }
  }

  // @override
  // Future<String> login(String email, String password) async {
  //   return await remoteDataSource.login(email, password);
  // }

// void handleLogin() async {
//   bool success = await login("samah@gmail.com", "aaaAAA333###");

//   if (success) {
//     print("✅ Login successful! Navigating to home page...");
//   } else {
//     print("❌ Login failed!");
//   }
// }

  @override
  Future<User> register(User user) async {
    final userModel = UserModel(
      id: '',
      email: user.email,
      password: user.password,
      name: user.name,
      faceOfTheCard: user.faceOfTheCard,
    );

    return await remoteDataSource.register(userModel, user.password);
  }
}// @override
  // Future<List<User>> getUsers() async {
  //   return await remoteDataSource.getUsers();
  // }

  // @override
  // Future<User> getUserById(String id) async {
  //   return await remoteDataSource.getUserById(id);
  // }

  // @override
  // Future<User> addUser(User user) async {
  //   return await remoteDataSource.addUser(user as UserModel);
  // }

  // @override
  // Future<User> updateUser(User user) async {
  //   return await remoteDataSource.updateUser(user as UserModel);
  // }

  // @override
  // Future<void> deleteUser(String id) async {
  //   await remoteDataSource.deleteUser(id);
  // }

