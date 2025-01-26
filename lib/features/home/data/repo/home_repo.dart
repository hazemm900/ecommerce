import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/home/data/apis/api_home.dart';
import 'package:ecommerce/features/home/data/model/home_model.dart';

class HomeRepo {
  final HomeWebServices _homeWebServices;

  HomeRepo(this._homeWebServices);

  Future<ApiResult<HomeModel>> getHome() async {
    try {
      final response = await _homeWebServices.getHome();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
