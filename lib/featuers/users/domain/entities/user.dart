class User {
  final String? id;
  final String email;
  final String password;
  final String? name;
  final String? faceOfTheCard;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.faceOfTheCard,
  });

  get token => null;
}
