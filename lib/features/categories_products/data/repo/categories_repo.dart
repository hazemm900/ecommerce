import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/auth/data/models/profile_model/profile_model.dart';
import 'package:ecommerce/features/categories_products/data/api/api_categories.dart';
import 'package:ecommerce/features/categories_products/data/model/categories_model.dart';
import 'package:ecommerce/features/categories_products/data/model/category_details_model.dart';
import 'package:ecommerce/features/categories_products/data/model/product_details_model.dart';

class CategoriesRepo {
  final CategoriesWebServices _categoriesWebServices;

  CategoriesRepo(this._categoriesWebServices);

  Future<ApiResult<CategoriesModel>> getCategories() async {
    try {
      final response = await _categoriesWebServices.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CategoryDetailsModel>> getCategoryDetails(
      int categoryId) async {
    try {
      final response =
          await _categoriesWebServices.getCategoryDetails(categoryId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductDetailsModel>> getProductsDetails(
      int productId) async {
    try {
      final response =
      await _categoriesWebServices.getProductsDetails(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
