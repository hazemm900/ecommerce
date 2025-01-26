import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class FaqsState {}

final class FaqsInitial extends FaqsState {}

final class FaqsLoadingState extends FaqsState {}

final class FaqsSuccessState extends FaqsState {}

final class FaqsFailureState extends FaqsState {
  final ApiErrorModel apiErrorModel;

  FaqsFailureState(this.apiErrorModel);
}
