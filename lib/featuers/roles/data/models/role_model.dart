import '../../domain/entities/role.dart';

class RoleModel extends Role {
  RoleModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
