import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoadingState extends FavoritesState {}

final class FavoritesSuccessState extends FavoritesState {}

final class FavoritesFailureState extends FavoritesState {
  final ApiErrorModel apiErrorModel;

  FavoritesFailureState(this.apiErrorModel);
}

final class AddOrRemoveItemLoadingState extends FavoritesState {}

final class AddOrRemoveItemSuccessState extends FavoritesState {}

final class AddOrRemoveItemFailureState extends FavoritesState {
  final ApiErrorModel apiErrorModel;

  AddOrRemoveItemFailureState(this.apiErrorModel);
}

final class DeleteItemFromCartLoadingState extends FavoritesState {}

final class DeleteItemFromCartSuccessState extends FavoritesState {}

final class DeleteItemFromCartFailureState extends FavoritesState {
  final ApiErrorModel apiErrorModel;

  DeleteItemFromCartFailureState(this.apiErrorModel);
}
