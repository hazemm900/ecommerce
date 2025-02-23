import 'package:ecommerce/features/faqs/data/model/faqs_model.dart';
import 'package:ecommerce/features/faqs/data/repo/faqs_repo.dart';
import 'package:ecommerce/features/faqs/logic/faqs_cubit/faqs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit(this._faqsRepo) : super(FaqsInitial());

  static FaqsCubit get(context) => BlocProvider.of(context);
  final FaqsRepo _faqsRepo;

  FaqsModel? faqsModel;

  void getFaqs() async {
    emit(FaqsLoadingState());
    final result = await _faqsRepo.getFaqs();
    result.when(success: (response) {
      faqsModel = response;
      emit(FaqsSuccessState());
    }, failure: (error) {
      emit(FaqsFailureState(error));
    });
  }
}
