class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.msg,
    required this.isLogin,
    required this.data,
    required this.tokenCode,
  });
  late final int success;
  late final String msg;
  late final bool isLogin;
  late final Data data;
  late final String tokenCode;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    isLogin = json['is_login'];
    data = Data.fromJson(json['data']);
    tokenCode = json['token_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['msg'] = msg;
    _data['is_login'] = isLogin;
    _data['data'] = data.toJson();
    _data['token_code'] = tokenCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isVerified,
    required this.isActive,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String isVerified;
  late final String isActive;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['is_verified'] = isVerified;
    _data['is_active'] = isActive;
    return _data;
  }
}
