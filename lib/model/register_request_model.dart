class RegisterRequestModel {
  RegisterRequestModel({
    required this.name,
    required this.emailId,
    required this.password,
  });
  String? name;
  String? emailId;
  String? password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emailId = json['emailId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['emailId'] = emailId;
    _data['password'] = password;
    return _data;
  }
  
}
