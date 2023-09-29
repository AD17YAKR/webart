import 'package:webart_assignment/model/login_request_model.dart';
import 'package:webart_assignment/model/otp_verify_model.dart';
import 'package:webart_assignment/model/register_request_model.dart';
import 'package:webart_assignment/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final AuthService authService = AuthService();
  RxBool isSent = false.obs;
  var isPasswordVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  var formKey = GlobalKey<FormState>();
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void registerButtonPressed() async {
    if (formKey.currentState!.validate()) {
      try {
        RegisterRequestModel registerModel = RegisterRequestModel(
          email: emailController.text,
          name: userNameController.text,
          password: passwordController.text,
          phone: phoneController.text,
        );
        var res = await authService.registerUser(registerModel);
        if (res.tokenCode.isNotEmpty) {
          isSent = true.obs;
          update();
        }
      } catch (error) {}
    }
  }

  void verifyButtonPressed() async {
    if (formKey.currentState!.validate()) {
      try {
        OTPVerifyModel otpVerifyModel = OTPVerifyModel(
          email: emailController.text,
          otp: otpController.text,
        );
        await authService.verifyOTP(otpVerifyModel);
      } catch (error) {}
    }
  }

  void resendOTPPressed() async {
    await authService.resendOTP(emailController.text);
  }
}
