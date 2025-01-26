import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/categories_products/data/api/api_categories_const.dart';
import 'package:ecommerce/features/categories_products/data/model/categories_model.dart';
import 'package:ecommerce/features/categories_products/data/model/category_details_model.dart';
import 'package:ecommerce/features/categories_products/data/model/product_details_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_categories.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CategoriesWebServices {
  factory CategoriesWebServices(Dio dio, {String? baseUrl}) =
      _CategoriesWebServices;

  @GET(CategoriesConst.categoriesEndPoint)
  Future<CategoriesModel> getCategories();

  @GET("${CategoriesConst.categoriesEndPoint}/{categoryId}")
  Future<CategoryDetailsModel> getCategoryDetails(@Path('categoryId') int categoryId);

  @GET("${CategoriesConst.productsEndPoint}/{productId}")
  Future<ProductDetailsModel> getProductsDetails(@Path('productId') int productId);


}
