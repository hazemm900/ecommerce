import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class SettingState {}

final class SettingInitial extends SettingState {}

final class SettingLoadingState extends SettingState {}

final class SettingSuccessState extends SettingState {}

final class SettingFailureState extends SettingState {
  final ApiErrorModel apiErrorModel;

  SettingFailureState(this.apiErrorModel);
}

