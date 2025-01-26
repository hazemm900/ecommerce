import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/settings/data/api_settings/api_settings_const.dart';
import 'package:ecommerce/features/settings/data/model/settings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_settings.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SettingsWebServices {
  factory SettingsWebServices(Dio dio, {String? baseUrl}) =
      _SettingsWebServices;

  @GET(SettingsConst.settingsEndPoint)
  Future<SettingsModel> getSettings();
}
