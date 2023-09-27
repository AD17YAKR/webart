import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webart_assignment/model/login_request_model.dart';
import 'package:webart_assignment/model/register_request_model.dart';
import 'package:webart_assignment/routes/app_routes.dart';
import 'package:webart_assignment/util/toast_message.dart';
import '../model/register_response_model.dart';
import '../model/login_response_model.dart';
import '../provider/api_provider.dart';

class AuthService {
  final ApiProvider _apiProvider = ApiProvider();

  Future<LoginResponseModel> loginUser(LoginModel loginModel) async {
    try {
      final loginResponse = await _apiProvider.loginUser(loginModel);
      showToastMessage('Login Successful! Welcome ');
      final box = GetStorage();
      box.write('token_code', loginResponse.tokenCode);
      box.write('name', loginResponse.data.name);
      Get.offAllNamed(Routes.DASHBOARD);
      return loginResponse;
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }

  Future<RegisterResponseModel> registerUser(
      RegisterRequestModel registerRequestModel) async {
    try {
      final registerResponse =
          await _apiProvider.registerUser(registerRequestModel);
      final box = GetStorage();
      box.write('token_code', registerResponse.tokenCode);
      box.write('name', registerResponse.data.name);
      showToastMessage('Registration Successful!');
      Get.offAllNamed(Routes.DASHBOARD);
      return registerResponse;
    } catch (e) {
      throw Exception('Registration Failed: $e');
    }
  }

  String? getAccessToken() {
    final box = GetStorage();
    return box.read('token_code');
  }

  bool isUserLoggedIn() {
    String? jwt = getAccessToken();
    if (jwt == '') {
      return false;
    } else {
      try {
        final parts = jwt!.split('.');
        if (parts.length != 3) {
          return false;
        }

        final payload = parts[1];
        final normalizedPayload = base64Url.normalize(payload);
        final payloadBytes = base64Url.decode(normalizedPayload);
        final payloadMap = json.decode(utf8.decode(payloadBytes));

        if (!payloadMap.containsKey('exp')) {
          return false;
        }

        final expiry =
            DateTime.fromMillisecondsSinceEpoch(payloadMap['exp'] * 1000);
        final now = DateTime.now();
        return !now.isAfter(expiry);
      } catch (e) {
        return false;
      }
    }
  }
}
