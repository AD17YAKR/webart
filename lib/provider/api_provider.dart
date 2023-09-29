import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:webart_assignment/model/login_request_model.dart';
import 'package:webart_assignment/model/login_response_model.dart';
import 'package:webart_assignment/util/toast_message.dart';

import '../model/otp_verify_model.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';
import '../routes/app_routes.dart';

class ApiProvider {
  final dio = Dio(BaseOptions(
      baseUrl:
          'https://wrappedinmusic.webbersunited.com:3001/api/frontend/users'));
  Future<LoginResponseModel> loginUser(LoginModel loginModel) async {
    try {
      print(loginModel.toJson());
      final response = await dio.post(
        '/login',
        data: loginModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        showErrorMessage("Failed");
        throw Exception('Failed to login');
      }
    } catch (error) {
      showErrorMessage("Failed , $error");
      throw Exception('Failed to connect to the server: $error');
    }
  }

  Future<RegisterResponseModel> registerUser(
      RegisterRequestModel registerModel) async {
    try {
      final response = await dio.post(
        '',
        data: registerModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        showErrorMessage("Failed");
        throw Exception('Failed to register');
      }
    } catch (error) {
      // showErrorMessage(error..toString());
      throw Exception('Failed to connect to the server: $error');
    }
  }

  Future<dynamic> verifyOTP(OTPVerifyModel otpVerifyModel) async {
    try {
      print(otpVerifyModel.toJson());
      final response = await dio.post(
        '/otp-verification',
        data: otpVerifyModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        showToastMessage(response.data['msg']);
        Get.offAllNamed(Routes.LOGIN);
        return response;
      } else {
        showErrorMessage("Failed");
        throw Exception('Failed to register');
      }
    } catch (error) {
      showErrorMessage("Failed  $error");
      throw Exception('Failed to connect to the server: $error');
    }
  }

  Future<dynamic> resendOTP(String email) async {
    try {
      final response = await dio.post(
        '/resent-otp',
        data: {"email": email},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        showToastMessage(response.data['msg']);
        return response;
      } else {
        showErrorMessage("Failed");
        throw Exception('Failed to register');
      }
    } catch (error) {
      showErrorMessage("Failed  $error");
      throw Exception('Failed to connect to the server: $error');
    }
  }
}
