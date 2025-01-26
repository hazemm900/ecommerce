import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/networking/dio_factory.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:ecommerce/features/auth/data/models/login_model/login_request_model.dart';
import 'package:ecommerce/features/auth/data/models/profile_model/profile_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_model.dart';
import 'package:ecommerce/features/auth/data/models/register_model/register_request_model.dart';
import 'package:ecommerce/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepo _authRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  LoginModel? loginModel;
  RegisterModel? registerModel;
  ProfileModel? profileModel;

  void logIn(context) async {
    emit(LoginLoadingState());
    final result = await _authRepo.logIn(LoginRequestModel(
        email: emailController.text, password: passwordController.text));
    result.when(success: (response) {
      loginModel = response;
      print("=======================================");
      print(loginModel?.data?.token);
      print(loginModel?.data?.email);
      print("=======================================");
      saveToken(response.data!.token!);
      Navigator.pushReplacementNamed(context, Routes.customBottomNavBarScreen);
      emit(LoginSuccessState());
    }, failure: (error) {
      emit(LoginFailureState(error));
    });
  }

  void register(context) async {
    emit(RegisterLoadingState());
    final result = await _authRepo.register(RegisterRequestModel(
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        image: imageController.text));
    result.when(success: (response) {
      CacheHelper.saveData(key: "token", value: registerModel?.data?.token);
      Navigator.pushReplacementNamed(context, Routes.customBottomNavBarScreen);
      emailController.clear();
      passwordController.clear();
      phoneController.clear();
      imageController.clear();
      emit(RegisterSuccessState());
    }, failure: (error) {
      emit(RegisterFailureState(error));
    });
  }

  void logOut(context) async {
    emit(LogOutLoadingState());
    final result = await _authRepo.logOut(CacheHelper.getData(key: "token"));
    result.when(success: (response) {
      CacheHelper.removeData(key: "token");
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(Routes.registerScreen);
      emit(LogOutSuccessState());
    }, failure: (error) {
      emit(LogOutFailureState(error));
    });
  }

  void profile() async {
    emit(ProfileLoadingState());
    final result = await _authRepo.profile();
    result.when(success: (response) {
      profileModel = response;
      nameController.text = profileModel?.data?.name ?? "";
      emailController.text = profileModel?.data?.email ?? "";
      phoneController.text = profileModel?.data?.phone ?? "";
      imageController.text = profileModel?.data?.image ?? "";
      emit(ProfileSuccessState());
    }, failure: (error) {
      emit(ProfileFailureState(error));
    });
  }

  void saveToken(String token) {
    CacheHelper.saveData(key: "token", value: token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
