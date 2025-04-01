import '../entities/user.dart';

abstract class UserRepository {
  Future<bool> login(String email, String password);
  Future<User> register(User user);
}
