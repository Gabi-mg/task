import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/network/models/result.dart';

part 'network_error.freezed.dart';

@freezed
class NetworkError with _$NetworkError implements AppError {
  const factory NetworkError.badRequest() = BadRequest;

  const factory NetworkError.conflict() = Conflict;

  const factory NetworkError.defaultError(String error) = DefaultError;

  const factory NetworkError.formatException() = FormatException;

  const factory NetworkError.internalServerError() = InternalServerError;

  const factory NetworkError.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkError.noInternetConnection() = NoInternetConnection;

  const factory NetworkError.notAcceptable() = NotAcceptable;

  const factory NetworkError.notFound(String reason) = NotFound;

  const factory NetworkError.notImplemented() = NotImplemented;

  const factory NetworkError.requestCancelled() = RequestCancelled;

  const factory NetworkError.requestTimeout() = RequestTimeout;

  const factory NetworkError.sendTimeout() = SendTimeout;

  const factory NetworkError.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkError.unableToProcess() = UnableToProcess;

  const factory NetworkError.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkError.unexpectedError() = UnexpectedError;

  static NetworkError checkStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return const NetworkError.unauthorizedRequest();
      case 404:
        return const NetworkError.notFound('Not found');
      case 409:
        return const NetworkError.conflict();
      case 408:
        return const NetworkError.requestTimeout();
      case 500:
        return const NetworkError.internalServerError();
      case 503:
        return const NetworkError.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkError.defaultError(
          'Received invalid status code: $responseCode',
        );
    }
  }

  static String getErrorMessage(NetworkError networkExceptions) {
    var message = '';
    networkExceptions.when(notImplemented: () {
      message = 'Not Implemented';
    }, requestCancelled: () {
      message = 'Request Cancelled';
    }, internalServerError: () {
      message = 'Internal Server Error';
    }, notFound: (String reason) {
      message = reason;
    }, serviceUnavailable: () {
      message = 'Service unavailable';
    }, methodNotAllowed: () {
      message = 'Method Allowed';
    }, badRequest: () {
      message = 'Bad request';
    }, unauthorizedRequest: () {
      message = 'Unauthorized request';
    }, unexpectedError: () {
      message = 'Unexpected error occurred';
    }, requestTimeout: () {
      message = 'Connection request timeout';
    }, noInternetConnection: () {
      message = 'No internet connection';
    }, conflict: () {
      message = 'Error due to a conflict';
    }, sendTimeout: () {
      message = 'Send timeout in connection with API server';
    }, unableToProcess: () {
      message = 'Unable to process the data';
    }, defaultError: (String error) {
      message = error;
    }, formatException: () {
      message = 'Unexpected error occurred';
    }, notAcceptable: () {
      message = 'Not acceptable';
    });
    return message;
  }

  static NetworkError getException(error) {
    if (error is Exception) {
      try {
        NetworkError networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkError.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkError.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = const NetworkError.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkError.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkError.checkStatusCode(error.response?.statusCode);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkError.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions =
                  NetworkError.checkStatusCode(error.response?.statusCode);
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  NetworkError.checkStatusCode(error.response?.statusCode);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkError.noInternetConnection();
        } else {
          networkExceptions = const NetworkError.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return const NetworkError.formatException();
      } catch (_) {
        return const NetworkError.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkError.unableToProcess();
      } else {
        return const NetworkError.unexpectedError();
      }
    }
  }
}
