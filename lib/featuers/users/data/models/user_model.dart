import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.password,
    required super.name,
    required super.faceOfTheCard,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      name: json['name']?.toString() ?? json['userName']?.toString() ?? '',
      faceOfTheCard: json['faceOfTheCard']?.toString() ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "faceOfTheCard": faceOfTheCard,
        "password": password,
      };
}
