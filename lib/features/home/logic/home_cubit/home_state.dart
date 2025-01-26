import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final ApiErrorModel apiErrorModel;

  HomeFailureState(this.apiErrorModel);
}
