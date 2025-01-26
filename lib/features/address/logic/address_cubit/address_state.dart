import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoadingState extends AddressState {}

final class AddressSuccessState extends AddressState {}

final class AddressFailureState extends AddressState {
  final ApiErrorModel apiErrorModel;

  AddressFailureState(this.apiErrorModel);
}

final class AddressUpdateLoadingState extends AddressState {}

final class AddressUpdateSuccessState extends AddressState {}

final class AddressUpdateFailureState extends AddressState {
  final ApiErrorModel apiErrorModel;

  AddressUpdateFailureState(this.apiErrorModel);
}

final class AddressDeleteLoadingState extends AddressState {}

final class AddressDeleteSuccessState extends AddressState {}

final class AddressDeleteFailureState extends AddressState {
  final ApiErrorModel apiErrorModel;

  AddressDeleteFailureState(this.apiErrorModel);
}
