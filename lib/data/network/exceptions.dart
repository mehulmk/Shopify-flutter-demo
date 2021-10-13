
import 'package:shopify/data/model/response.dart';

class NetworkException implements Exception {
  String? message;
  int? statusCode;

  NetworkException({this.message, this.statusCode});

  @override
  String toString() {
    return 'NetworkException{message: $message, statusCode: $statusCode}';
  }
}

class FieldException implements Exception {
  String? message;
  Error? error;

  FieldException({this.message, this.error});

  @override
  String toString() {
    return 'NetworkException{message: $message, error: ${error!.toJson()}}';
  }
}

class AuthException extends NetworkException {
  AuthException({message, statusCode})
      : super(message: message, statusCode: statusCode);

  @override
  String toString() {
    return 'AuthException{}';
  }
}
