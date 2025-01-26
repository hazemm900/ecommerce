import 'package:ecommerce/features/categories_products/data/model/categories_model.dart';
import 'package:ecommerce/features/categories_products/data/model/category_details_model.dart';
import 'package:ecommerce/features/categories_products/data/model/product_details_model.dart';
import 'package:ecommerce/features/categories_products/data/repo/categories_repo.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  final CategoriesRepo _categoriesRepo;

  CategoriesModel? categoriesModel;
  CategoryDetailsModel? categoryDetailsModel;
  ProductDetailsModel? productDetailsModel;

  void getCategories() async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.getCategories();
    result.when(success: (response) {
      categoriesModel = response;
      emit(CategoriesSuccessState());
    }, failure: (error) {
      emit(CategoriesFailureState(error));
    });
  }

  void getCategoryDetails(int categoryId) async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.getCategoryDetails(categoryId);
    result.when(success: (response) {
      categoryDetailsModel = response;
      emit(CategoryDetailsSuccessState());
    }, failure: (error) {
      emit(CategoryDetailsFailureState(error));
    });
  }

  void getProductsDetails(int productId) async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.getProductsDetails(productId);
    result.when(success: (response) {
      productDetailsModel = response;
      emit(CategoryDetailsSuccessState());
    }, failure: (error) {
      emit(CategoryDetailsFailureState(error));
    });
  }
}
