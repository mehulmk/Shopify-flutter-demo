import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify/data/model/response.dart';
import 'package:shopify/data/network/exceptions.dart';

class _LiftErrorStreamSink<S> implements EventSink<S> {
  final EventSink<S> _outputSink;

  _LiftErrorStreamSink(this._outputSink);

  @override
  void add(S data) => _outputSink.add(data);

  @override
  void addError(e, [st]) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          _outputSink.addError(
              NetworkException(message: "Server is under maintenance"));
          break;
        case DioErrorType.other:
          if (e.error is SocketException) {
            _outputSink
                .addError(NetworkException(message: "No internet connection"));
          } else if (e.error is FormatException) {
            _outputSink
                .addError(NetworkException(message: "Data format exception"));
          } else {
            _outputSink.addError(NetworkException(message: e.message));
          }
          break;
        case DioErrorType.response:
          if (e.response?.statusCode == 404) {
            _outputSink.addError(NetworkException(
                message: "Server is under maintenance", statusCode: 404));
          } else if (e.response?.statusCode == 401) {
            _outputSink.addError(NetworkException(
                message: "Unauthorized user", statusCode: 401));
          } else if (e.response!.statusCode == 502) {
            _outputSink.addError(
                NetworkException(message: "Bad request", statusCode: 502));
          } else if (e.response?.statusCode == 500) {
            _outputSink.addError(NetworkException(
                message: "Internal Server Error", statusCode: 500));
          } else {
            CommonResponse response = CommonResponse.fromJson(e.response?.data);
            if (response.responseData?.error == null) {
              _outputSink.addError(
                  FieldException(message: response.responseData!.message));
            } else {
              _outputSink.addError(
                  FieldException(error: response.responseData!.error));
            }
          }
          break;
        default:
          _outputSink.addError(
              NetworkException(message: "Server is under maintenance"));
          break;
      }
    } else if (e is NetworkException) {
      _outputSink.addError(e);
    } else {
      _outputSink.addError(NetworkException(message: "$e"));
    }
  }

  @override
  void close() => _outputSink.close();
}

class LiftErrorStreamTransformer<S> extends StreamTransformerBase<S, S> {
  LiftErrorStreamTransformer();

  @override
  Stream<S> bind(Stream<S> stream) =>
      Stream.eventTransformed(stream, (sink) => _LiftErrorStreamSink<S>(sink));
}

extension LiftErrorExtension<S> on Stream<S> {
  Stream<S> liftError() => transform(LiftErrorStreamTransformer());
}

void main() {
  Stream.fromIterable([1, 2, 3, 4])
      .map((event) {
        if (event == 4) {
          throw Exception("error");
        } else {
          return event;
        }
      })
      .liftError()
      .listen((event) {
        if (kDebugMode) {
          print("$event");
        }
      });
}
