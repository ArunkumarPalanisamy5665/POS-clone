import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/base_reponse_model.dart';
import '../../domain/models/failure_model.dart';
import '../constants/api_endpoints.dart';
import '../../core/local_storage/preference_helper.dart';
import '../../core/network/interceptor/custom_interceptor.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();
  late Dio _dio;

  factory ApiHelper() => _instance;

  ApiHelper._internal() {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        // headers: await getHeaders(),
        responseType: ResponseType.json,
      ),
    );

    final adapter = IOHttpClientAdapter();
    adapter.createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.httpClientAdapter = adapter;

    _dio.interceptors.add(CustomInterceptor());
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
      ),
    );
  }

  // PARSER → Convert response JSON → BaseResponseModel<T>
  BaseResponseModel<T> _parseResponse<T>(
      Response response,
      T Function(dynamic)? fromJson,
      ) {


    return BaseResponseModel<T>.fromJson(response.data, fromJson);
  }

  // HANDLE DIO ERRORS
  FailureModel _handleError(DioException e, StackTrace st) {
    int? httpStatus = e.response?.statusCode;

    int? errno;
    String? osMessage;

    if (e.error is SocketException) {
      final se = e.error as SocketException;
      errno = se.osError?.errorCode;
      osMessage = se.osError?.message;
    }

    int? finalStatus = httpStatus ?? errno;

    // 🔥 Extract message from API response JSON
    String apiMessage = "";
    if (e.response?.data is Map) {
      apiMessage = e.response?.data["message"]?.toString() ?? "";
    }

    // 🔥 Final error message priority:
    // 1. API message
    // 2. OS message
    // 3. Dio message
    // 4. Fallback
    final finalMessage =
    apiMessage.isNotEmpty ? apiMessage :
    osMessage?.toString() ??
        e.message?.toString() ??
        "Unknown error";

    return FailureModel(
      statusCode: finalStatus,
      errno: errno,
      message: finalMessage,
      errorType: e.type.toString(),
      rawResponse: e.response?.data,
      stackTrace: st,
    );
  }

  Either<FailureModel, BaseResponseModel<T>> _wrap<T>(
      BaseResponseModel<T> base,
      ) {
    if (base.isSuccess) {
      return Right(base);
    }

    return Left(
      FailureModel(
        statusCode: base.statusCode,
        message: base.message,
        errorType: "API_ERROR",
      ),
    );
  }

  // GET
  Future<Either<FailureModel, dynamic>> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // POST
  Future<Either<FailureModel, dynamic>> post(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // PUT
  Future<Either<FailureModel, dynamic>> put(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // PATCH
  Future<Either<FailureModel, dynamic>> patch(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // DELETE
  Future<Either<FailureModel, dynamic>> delete(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // MULTIPART
  Future<Either<FailureModel, dynamic>> multipart(
      String endpoint, {
        required Map<String, dynamic> fields,
        Map<String, String>? files,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        Options? options,
      }) async {
    try {
      final formData = FormData();

      fields.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (files != null) {
        for (var file in files.entries) {
          formData.files.add(
            MapEntry(
              file.key,
              await MultipartFile.fromFile(file.value),
            ),
          );
        }
      }

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data);
    } on DioException catch (e, st) {
      return Left(_handleError(e, st));
    } catch (e, st) {
      return Left(FailureModel.fromException(e, st));
    }
  }

  // HEADERS
  Future<Map<String, dynamic>> getHeaders({String? token}) async {
    String? savedToken =
    await PreferenceHelper.getString(PreferenceHelper.accessToken);

    String finalToken = token ?? savedToken ?? "";

    return {
      "Authorization": finalToken.isNotEmpty ? "Bearer $finalToken" : "",
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Language": "en",
    };
  }

  void close() => _dio.close();
  void setBaseUrl(String url) => _dio.options.baseUrl = url;
  void addHeader(String key, String value) => _dio.options.headers[key] = value;
  void removeHeader(String key) => _dio.options.headers.remove(key);
  void setBearerToken(String token) => _dio.options.headers['Authorization'] = 'Bearer $token';
}
