import 'package:dio/dio.dart';
import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 100);
    dio ??= Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    addDioHeaders(); // Ensure headers are added when Dio is initialized
    addDioInterceptor();

    return dio!;
  }

  static Future<void> addDioHeaders() async {
    String? lang =
        await CacheHelper.getData(key: "lang") ?? "en"; // Default to English
    dio?.options.headers = {
      'Authorization': '${await CacheHelper.getData(key: "token")}',
      'Accept': 'application/json',
      "lang": lang, // Add the language to the headers
    };
  }

  static Future<void> setTokenIntoHeaderAfterLogin(String token) async {
    String? lang = await CacheHelper.getData(key: "lang") ?? "en";
    dio?.options.headers = {
      'Authorization': '$token',
      'Accept': 'application/json',
      "lang": lang,
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
