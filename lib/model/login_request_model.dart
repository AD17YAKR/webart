class LoginModel {
  LoginModel({
    required this.emailId,
    required this.password,
  });
  late final String emailId;
  late final String password;

  LoginModel.fromJson(Map<String, dynamic> json) {
    emailId = json['emailId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['emailId'] = emailId;
    _data['password'] = password;
    return _data;
  }
}
