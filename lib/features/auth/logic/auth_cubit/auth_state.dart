import 'package:ecommerce/core/networking/api_error_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginFailureState extends AuthState {
  final ApiErrorModel apiErrorModel;

  LoginFailureState(this.apiErrorModel);
}


final class RegisterSuccessState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final ApiErrorModel apiErrorModel;

  RegisterFailureState(this.apiErrorModel);
}


final class LogOutSuccessState extends AuthState {}

final class LogOutLoadingState extends AuthState {}

final class LogOutFailureState extends AuthState {
  final ApiErrorModel apiErrorModel;

  LogOutFailureState(this.apiErrorModel);
}


final class ProfileSuccessState extends AuthState {}

final class ProfileLoadingState extends AuthState {}

final class ProfileFailureState extends AuthState {
  final ApiErrorModel apiErrorModel;

  ProfileFailureState(this.apiErrorModel);
}