class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone_number,
    required this.token,
    this.emailVerifiedAt,
    this.updatedAt,
    this.createdAt,
  });
  late final String id;
  late final String token;
  late final String name;
  late final String email;
  late final String phone_number;
  late final Null emailVerifiedAt;
  late final Null createdAt;
  late final Null updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    UserModel(
      id: json['id'],
      token: json['token'],
      name: json['name'],
      email: json['email'],
      phone_number: json['phone_number'],
      emailVerifiedAt: json['emailVerifiedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['token'] = token;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
