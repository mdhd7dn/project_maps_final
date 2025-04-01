import 'package:my_case/featuers/user_lawyer_relationship/domain/entities/user_lawyer_relationship.dart';

class UserLawyerWithModel extends UserLawyerWith {
  UserLawyerWithModel({
    required int id,
    required String userId,
    required int courtsId,
    required int caseId,
  }) : super(
          id: id,
          userId: userId,
          courtsId: courtsId,
          caseId: caseId,
        );

  /// **تحويل JSON إلى `UserLawyerWithModel`**
  factory UserLawyerWithModel.fromJson(Map<String, dynamic> json) {
    return UserLawyerWithModel(
      id: json['id'],
      userId: json['userId'],
      courtsId: json['courtsId'],
      caseId: json['caseId'],
    );
  }

  /// **تحويل `UserLawyerWithModel` إلى JSON**
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "courtsId": courtsId,
      "caseId": caseId,
    };
  }
}
