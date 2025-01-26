import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/favorites/data/apis/api_favorites_const.dart';
import 'package:ecommerce/features/favorites/data/model/add_or_remove_favorites_model.dart';
import 'package:ecommerce/features/favorites/data/model/favorites_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_favorites.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FavoritesWebServices {
  factory FavoritesWebServices(Dio dio, {String? baseUrl}) = _FavoritesWebServices;

  @GET(FavoritesConst.favoritesEndPoint)
  Future<FavoritesModel> getFavorites();

  @POST(FavoritesConst.favoritesEndPoint)
  Future<AddOrRemoveFavoritesModel> addOrRemoveFavoritesItem(@Body() ProductIdRequestModel productIdRequestModel);


  @DELETE("${FavoritesConst.favoritesEndPoint}/{productId}")
  Future<void> deleteItem(@Path("productId") int productId);
}
