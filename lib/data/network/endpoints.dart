import 'package:shopify/utility/key_util.dart';

class Endpoints {
  Endpoints._();

  //PROD base url
  static String baseUrl = KeyUtil.baseUrl;
  static const imageBaseUrl = "";

  //DEV base url
  // static const String baseUrl = KeyUtil.baseUrl;
  // static const imageBaseUrl = "";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;
}
