import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(OnBoardingChangeIndex());
  }
}
