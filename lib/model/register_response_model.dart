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
    required this.msg,
  });
  late final String msg;

  Data.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    return _data;
  }
}
