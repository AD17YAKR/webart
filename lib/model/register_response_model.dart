class RegisterResponseModel {
  RegisterResponseModel({
    required this.success,
    required this.data,
    required this.tokenCode,
  });
  late final int success;
  late final Data data;
  late final String tokenCode;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    tokenCode = json['token_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['token_code'] = tokenCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.emailId,
    required this.password,
    required this.name,
    required this.otp,
    required this.isVerified,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String emailId;
  late final String password;
  late final String name;
  late final String otp;
  late final String isVerified;
  late final String isActive;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    emailId = json['emailId'];
    password = json['password'];
    name = json['name'];
    otp = json['otp'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['emailId'] = emailId;
    _data['password'] = password;
    _data['name'] = name;
    _data['otp'] = otp;
    _data['isVerified'] = isVerified;
    _data['isActive'] = isActive;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
