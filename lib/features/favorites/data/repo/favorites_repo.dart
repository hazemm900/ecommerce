import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/favorites/data/apis/api_favorites.dart';
import 'package:ecommerce/features/favorites/data/model/add_or_remove_favorites_model.dart';
import 'package:ecommerce/features/favorites/data/model/favorites_model.dart';

class FavoritesRepo {
  final FavoritesWebServices _favoritesWebServices;

  FavoritesRepo(this._favoritesWebServices);

  Future<ApiResult<FavoritesModel>> getFavorites() async {
    try {
      final response = await _favoritesWebServices.getFavorites();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddOrRemoveFavoritesModel>> addOrRemoveFavoriteItem(
      ProductIdRequestModel productIdRequestModel) async {
    try {
      final response = await _favoritesWebServices.addOrRemoveFavoritesItem(productIdRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


  Future<ApiResult<void>> deleteItem(int productId) async {
    try {
      final response = await _favoritesWebServices.deleteItem(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
