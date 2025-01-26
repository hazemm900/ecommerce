import 'dart:developer';

import 'package:ecommerce/features/faqs/data/model/faqs_model.dart';


import 'package:ecommerce/features/settings/data/model/settings_model.dart';
import 'package:ecommerce/features/settings/data/repo/settings_repo.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this._settingsRepo) : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);
  final SettingsRepo _settingsRepo;
  // final FaqsRepo _faqsRepo;

  SettingsModel? settingsModel;
  FaqsModel? faqsModel;

  void getSettings() async {
    emit(SettingLoadingState());
    final result = await _settingsRepo.getSettings();
    result.when(success: (response) {
      settingsModel = response;
      log(response.toString());
      emit(SettingSuccessState());
    }, failure: (error) {
      emit(SettingFailureState(error));
    });
  }
  // void getFaqs() async {
  //   emit(FaqsLoadingState());
  //   final result = await _faqsRepo.getFaqs();
  //   result.when(success: (response) {
  //     faqsModel = response;
  //     emit(FaqsSuccessState());
  //   }, failure: (error) {
  //     emit(FaqsFailureState(error));
  //   });
  // }
}
