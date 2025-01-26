import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/auth/data/apis/api_const.dart';
import 'package:ecommerce/features/auth/data/models/fcm_model/fcm_model.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_request_model.dart';
import 'package:ecommerce/features/auth/data/models/profile_model/profile_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_request_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_auth.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthWebServices {
  factory AuthWebServices(Dio dio, {String? baseUrl}) = _AuthWebServices;

  @POST(AuthConst.loginEndPoint)
  Future<LoginModel> logIn(@Body() LoginRequestModel loginRequestModel);

  @POST(AuthConst.registerEndPoint)
  Future<RegisterModel> register(@Body() RegisterRequestModel registerRequestModel);
  
  @POST(AuthConst.logoutEndPoint)
  Future<dynamic> logOut(@Body() String token);

  @GET(AuthConst.profileEndPoint)
  Future<ProfileModel> profile();

  @POST(AuthConst.fcmEndPoint)
  Future<FCMModel> fcmToken(@Body() String fcmToken);

}
