class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.data,
    required this.tokenCode,
  });
  late final int success;
  late final Data data;
  late final String tokenCode;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.name,
  });
  late final String name;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}
