import 'package:dio/dio.dart';
import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    if (dio == null) {
      Duration timeOut = const Duration(seconds: 100);
      dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      await addDioHeaders(); // Ensure headers are set on initialization
      addDioInterceptor();
    }
    return dio!;
  }

  static Future<void> addDioHeaders() async {
    String lang =
        await CacheHelper.getData(key: "lang") ?? "en"; // Default to English
    String? token = await CacheHelper.getData(key: "token");

    dio?.options.headers = {
      'Authorization': token ?? "",
      'Accept': 'application/json',
      "lang": lang,
    };
  }

  static Future<void> updateLanguageHeader(String newLang) async {
    await CacheHelper.saveData(key: "lang", value: newLang);
    await addDioHeaders(); // Update Dio headers immediately
  }

  static Future<void> setTokenIntoHeaderAfterLogin(String token) async {
    await CacheHelper.saveData(key: "token", value: token);
    await addDioHeaders(); // Ensures token is updated correctly
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
