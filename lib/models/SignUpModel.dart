class SignUpBody {
  SignUpBody({
    required this.email,
    required this.password,
    required this.name,
    required this.passwordConfirmation,
    required this.phone_number,
    required this.validationMethod,
  });
  late final String email;
  late final String password;
  late final String name;
  late final String passwordConfirmation;
  late final String phone_number;
  late final String validationMethod;

  SignUpBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    passwordConfirmation = json['password_confirmation'];
    phone_number = json['phone_number'];
    validationMethod = json['validation_method'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    _data['password_confirmation'] = passwordConfirmation;
    _data['phone_number'] = phone_number;
    _data['validation_method'] = validationMethod;
    return _data;
  }
}
