import '../../../model/login_request_model.dart';
import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AuthState { phoneNumberInput, otpInput }

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var currentAuthState = AuthState.phoneNumberInput.obs;
  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void loginButtonPressed() async {
    if (formKey.currentState!.validate()) {
      final loginModel = LoginModel(
        emailId: emailController.text,
        password: passwordController.text,
      );
      authService.loginUser(loginModel);
    }
  }
}
