import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class CartsState {}

final class CartsInitial extends CartsState {}

final class CartsLoadingState extends CartsState {}

final class CartsSuccessState extends CartsState {}

final class CartsFailureState extends CartsState {
  final ApiErrorModel apiErrorModel;

  CartsFailureState(this.apiErrorModel);
}

final class AddOrRemoveItemLoadingState extends CartsState {}

final class AddOrRemoveItemSuccessState extends CartsState {}

final class AddOrRemoveItemFailureState extends CartsState {
  final ApiErrorModel apiErrorModel;

  AddOrRemoveItemFailureState(this.apiErrorModel);
}

final class UpdateItemFromCartLoadingState extends CartsState {}

final class UpdateItemFromCartSuccessState extends CartsState {}

final class UpdateItemFromCartFailureState extends CartsState {
  final ApiErrorModel apiErrorModel;

  UpdateItemFromCartFailureState(this.apiErrorModel);
}

final class DeleteItemFromCartLoadingState extends CartsState {}

final class DeleteItemFromCartSuccessState extends CartsState {}

final class DeleteItemFromCartFailureState extends CartsState {
  final ApiErrorModel apiErrorModel;

  DeleteItemFromCartFailureState(this.apiErrorModel);
}