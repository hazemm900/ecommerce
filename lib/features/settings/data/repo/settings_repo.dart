import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/settings/data/api_settings/api_settings.dart';
import 'package:ecommerce/features/settings/data/model/settings_model.dart';

class SettingsRepo {
  final SettingsWebServices _settingsWebServices;

  SettingsRepo(this._settingsWebServices);

  Future<ApiResult<SettingsModel>> getSettings() async {
    try {
      final response = await _settingsWebServices.getSettings();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
