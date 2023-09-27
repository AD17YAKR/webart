import 'package:webart_assignment/model/register_request_model.dart';
import 'package:webart_assignment/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final AuthService authService = AuthService();
  RxBool isLoading = false.obs;
  var isPasswordVisible = true.obs;
  static AssetImage backgroundImage =
      AssetImage('assets/images/background.jpg');

  static Future<void> _preloadImage() async {
    await precacheImage(backgroundImage, Get.context!);
  }

  @override
  void onInit() {
    super.onInit();
    _preloadImage();
  }

  var formKey = GlobalKey<FormState>();
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void registerButtonPressed() async {
    if (formKey.currentState!.validate()) {
      try {
        RegisterRequestModel registerModel = RegisterRequestModel(
          emailId: emailController.text,
          name: userNameController.text,
          password: passwordController.text,
        );
        isLoading = true.obs;
        await authService.registerUser(registerModel);
        isLoading = false.obs;
      } catch (error) {
        Get.snackbar('title', error.toString());
      }
    }
  }
}
