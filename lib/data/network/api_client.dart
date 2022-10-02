import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopify/data/network/endpoints.dart';
import 'package:shopify/data/sharedpref/shared_preference_helper.dart';
import 'package:shopify/utility/key_util.dart';
import 'package:shopify/utility/path.dart';

class ApiService {
  late Dio dio;
  SharedPreferencesHelper sharedPrefsHelper;

  ApiService(this.sharedPrefsHelper) {
    dio = Dio();
    _initApiClient();
  }

  void _initApiClient() {
    dio
      // ..interceptors.add(LogInterceptor())
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          error: true,
          compact: false))
      ..options.baseUrl = Endpoints.baseUrl;

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      options.headers["X-Shopify-Access-Token"] = KeyUtil.token;

      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
  }

  Future<Response> get(
      {required Path path, Map<String, dynamic>? params}) async {
    return await dio.get(path.toString(), queryParameters: params);
  }
}
