import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  static ChangeThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false; // Default mode is light

  void loadTheme() {
    isDark = CacheHelper.getData(key: "isDark") ?? false;
    emit(ChangeThemeSuccessState());
  }

  void changeTheme() {
    isDark = !isDark;
    CacheHelper.saveData(key: "isDark", value: isDark);
    emit(ChangeThemeSuccessState());
  }
}
