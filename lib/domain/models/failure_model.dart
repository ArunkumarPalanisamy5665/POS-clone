// import 'package:dio/dio.dart';
//
// class FailureResponse {
//   final bool success;
//   final String message;
//   final int? statusCode;
//   final dynamic data;
//
//   FailureResponse({
//     required this.message,
//     this.success = false,
//     this.statusCode,
//     this.data,
//   });
//
//   factory FailureResponse.fromApiResponse(Map<String, dynamic> json) {
//     return FailureResponse(
//       message: json["message"]?.toString() ?? "Unknown error",
//       success: json["success"] ?? false,
//       statusCode: json["status"] ?? json["statusCode"],
//       data: json["data"],
//     );
//   }
//
//   factory FailureResponse.fromDioException(DioException e) {
//     final status = e.response?.statusCode;
//     final msg = e.response?.data is Map
//         ? e.response?.data["message"]?.toString()
//         : e.message;
//
//     return FailureResponse(
//       message: msg ?? "Network error",
//       success: false,
//       statusCode: status,
//       data: e.response?.data,
//     );
//   }
// }
//
 import 'dart:io';

import 'package:dio/dio.dart';
class FailureModel {
  final int? statusCode;      // final chosen status code (HTTP or errno)
  final int? errno;           // OS-level error code (110, 111, etc.)
  final String message;
  final String? errorType;
  final dynamic rawResponse;
  final StackTrace? stackTrace;

  FailureModel({
    required this.statusCode,
    required this.message,
    this.errno,
    this.errorType,
    this.rawResponse,
    this.stackTrace,
  });

  factory FailureModel.fromException(dynamic error, StackTrace? stackTrace) {
    if (error is DioException) {
      int? httpStatus = error.response?.statusCode;

      int? osErrno;
      String? osMessage;

      // Extract OS errno
      if (error.error is SocketException) {
        osErrno = (error.error as SocketException).osError?.errorCode;
        osMessage = (error.error as SocketException).osError?.message;
      }

      // Fallback rule: if HTTP code is null, use errno
      final int? finalStatus = httpStatus ?? osErrno;

      return FailureModel(
        statusCode: finalStatus,
        errno: osErrno,
        message: error.message ?? osMessage ?? 'An error occurred',
        errorType: error.type.toString(),
        rawResponse: error.response?.data,
        stackTrace: stackTrace,
      );
    }

    return FailureModel(
      statusCode: null,
      errno: null,
      message: error.toString(),
      errorType: 'Unknown Error',
      stackTrace: stackTrace,
    );
  }

  @override
  String toString() =>
      'Failure(statusCode: $statusCode, errno: $errno, message: $message, errorType: $errorType)';
}

