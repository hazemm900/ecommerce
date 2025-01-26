import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/home/data/apis/api_home_const.dart';
import 'package:ecommerce/features/home/data/model/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_home.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeWebServices {
  factory HomeWebServices(Dio dio, {String? baseUrl}) = _HomeWebServices;

  @GET(HomeConst.homeEndPoint)
  Future<HomeModel> getHome();
}
