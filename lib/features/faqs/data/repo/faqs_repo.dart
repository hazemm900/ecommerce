import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/faqs/data/apis/api_faqs.dart';
import 'package:ecommerce/features/faqs/data/model/faqs_model.dart';

class FaqsRepo {
  final FaqsWebServices _faqsWebServices;

  FaqsRepo(this._faqsWebServices);

  Future<ApiResult<FaqsModel>> getFaqs() async {
    try {
      final response = await _faqsWebServices.getFaqs();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
