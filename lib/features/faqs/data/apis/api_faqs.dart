import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/faqs/data/apis/api_faqs_const.dart';
import 'package:ecommerce/features/faqs/data/model/faqs_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_faqs.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FaqsWebServices {
  factory FaqsWebServices(Dio dio, {String? baseUrl}) = _FaqsWebServices;

  @GET(FaqsConst.faqsEndPoint)
  Future<FaqsModel> getFaqs();
}
