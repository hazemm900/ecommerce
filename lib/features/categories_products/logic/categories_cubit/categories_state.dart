import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesSuccessState extends CategoriesState {}

final class CategoriesFailureState extends CategoriesState {
  final ApiErrorModel apiErrorModel;

  CategoriesFailureState(this.apiErrorModel);
}

final class CategoryDetailsLoadingState extends CategoriesState {}

final class CategoryDetailsSuccessState extends CategoriesState {}

final class CategoryDetailsFailureState extends CategoriesState {
  final ApiErrorModel apiErrorModel;

  CategoryDetailsFailureState(this.apiErrorModel);
}
