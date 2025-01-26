import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/cart/data/apis/api_carts_const.dart';
import 'package:ecommerce/features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:ecommerce/features/cart/data/model/get_cart_model.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_item_quantity_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_or_delete_cart_item_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_carts.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartsWebServices {
  factory CartsWebServices(Dio dio, {String? baseUrl}) = _CartsWebServices;

  @GET(CartsConst.cartsEndPoint)
  Future<GetCartModel> getAllCarts();

  @POST(CartsConst.cartsEndPoint)
  Future<AddOrRemoveToCartModel> addOrRemoveCartItem(@Body() ProductIdRequestModel productIdRequestModel);

  @PUT("${CartsConst.cartsEndPoint}/{productId}")
  Future<UpdateOrDeleteCartItemModel> updateItemQuantity(
    @Path("productId") int productID,
    @Body() UpdateQuantityRequest request,
  );

  @DELETE("${CartsConst.cartsEndPoint}/{productId}")
  Future<void> deleteItem(@Path("productId") int productId);
}
