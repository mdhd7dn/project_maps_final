import '../entities/user_lawyer_relationship.dart';

abstract class UserLawyerRelationshipRepository {
  Future<UserLawyerWith> addRelationship(UserLawyerWith relationship);
  Future<List<UserLawyerWith>> getRelationships();
  Future<UserLawyerWith> getRelationshipById(int id); // تعديل من String إلى int
  Future<void> deleteRelationship(int id); // تعديل من String إلى int
  Future<UserLawyerWith> updateRelationship(UserLawyerWith relationship);
}
