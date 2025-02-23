import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/auth/data/apis/api_auth.dart';
import 'package:ecommerce/features/auth/data/models/fcm_model/fcm_model.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_request_model.dart';
import 'package:ecommerce/features/auth/data/models/profile_model/profile_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_request_model.dart';

class AuthRepo {
  final AuthWebServices _authWebServices;

  AuthRepo(this._authWebServices);

  Future<ApiResult<LoginModel>> logIn(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _authWebServices.logIn(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RegisterModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await _authWebServices.register(registerRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult> logOut(String token) async {
    try {
      final response = await _authWebServices.logOut(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProfileModel>> profile() async {
    try {
      final response = await _authWebServices.profile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<FCMModel>> fcmToken(String fcmToken) async {
    try {
      final response = await _authWebServices.fcmToken(fcmToken);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
