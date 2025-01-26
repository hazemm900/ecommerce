import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/cart/data/apis/api_carts.dart';
import 'package:ecommerce/features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:ecommerce/features/cart/data/model/get_cart_model.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_item_quantity_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_or_delete_cart_item_model.dart';

class CartsRepo {
  final CartsWebServices _cartsWebServices;

  CartsRepo(this._cartsWebServices);

  Future<ApiResult<GetCartModel>> getAllCarts() async {
    try {
      final response = await _cartsWebServices.getAllCarts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddOrRemoveToCartModel>> addOrRemoveCartItem(
      ProductIdRequestModel productIdRequestModel) async {
    try {
      final response = await _cartsWebServices.addOrRemoveCartItem(productIdRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateOrDeleteCartItemModel>> updateItemQuantity(
      int productID, UpdateQuantityRequest updateQuantityRequest) async {
    try {
      final response = await _cartsWebServices.updateItemQuantity(
          productID, updateQuantityRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteItem(int productId) async {
    try {
      final response = await _cartsWebServices.deleteItem(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
