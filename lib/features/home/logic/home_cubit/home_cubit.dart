import 'package:ecommerce/features/home/data/model/home_model.dart';
import 'package:ecommerce/features/home/data/repo/home_repo.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo _homeRepo;

  HomeModel? homeModel;

  void getHome() async {
    emit(HomeLoadingState());
    final result = await _homeRepo.getHome();
    result.when(success: (response) {
      homeModel = response;
      emit(HomeSuccessState());
    }, failure: (error) {
      emit(HomeFailureState(error));
    });
  }
}
