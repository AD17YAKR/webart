import 'package:dio/dio.dart';
import 'package:webart_assignment/model/login_request_model.dart';
import 'package:webart_assignment/model/login_response_model.dart';
import 'package:webart_assignment/util/toast_message.dart';

import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

class ApiProvider {
  final dio =
      Dio(BaseOptions(baseUrl: 'http://document.apibag.in:3001/v1/student'));
  Future<LoginResponseModel> loginUser(LoginModel loginModel) async {
    try {
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
      showErrorMessage("Failed");
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
      showErrorMessage("Failed");
      throw Exception('Failed to connect to the server: $error');
    }
  }
}
