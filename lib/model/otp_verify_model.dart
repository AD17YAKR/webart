class OTPVerifyModel {
  OTPVerifyModel({
    required this.email,
    this.otp,
  });
  String? email;
  String? otp;

  OTPVerifyModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['otp'] = otp;
    return _data;
  }
}
