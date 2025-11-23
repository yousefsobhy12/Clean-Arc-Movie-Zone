class UserEntity {
  final String? id;
  final String? name;
  final String email;
  final String password;

  UserEntity({this.id, this.name, required this.email, required this.password});
}
